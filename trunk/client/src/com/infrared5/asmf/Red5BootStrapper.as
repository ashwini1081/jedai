////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007-2008 Infrared5 Incorporated
//  All Rights Reserved. The following is Source Code and is subject to all
//  restrictions on such code as contained in the End User License Agreement
//  accompanying this product.
//
////////////////////////////////////////////////////////////////////////////////


package com.infrared5.asmf
{
	import com.infrared5.asmf.events.Red5Event;
	import com.infrared5.asmf.net.ClientManager;
	import com.infrared5.asmf.net.rpc.Red5Connection;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.SharedObject;
	
	import mx.controls.Alert;
	
	import org.pranaframework.ioc.ObjectContainer;
	import org.pranaframework.ioc.loader.ObjectDefinitionsLoaderEvent;
	import org.pranaframework.ioc.loader.XmlObjectDefinitionsLoader;
	
	[Event(name="bootComplete", type="com.infrared5.asmf.events.Red5Event")]
	
	/**
	 * Red5BootStrapper takes care of steps 1-3 in "Workflow(wrapped)" in Basecamp:
	 * 
	 * 1. Create a NetConnection ( by config.xml )
     * 2. Create a NetStream → Camera / Microphone & Video / Sound 
     * ( by app-context.xml via AMF with the "context" Red5Connection )
     * 3. Attach everything together ( automated by app-context.xml via AMF )
	 * 
	 * @author Dominick Accattato (dominick@infrared5.com)
	 * @author Jon Valliere ( jvalliere@emoten.com )
	 */
	public class Red5BootStrapper extends EventDispatcher
	{
		private var _objectDefinitionsLoader:XmlObjectDefinitionsLoader;
		private var _client:ClientManager;
		private var _connection:Red5Connection;
		private var _config:String;
		private static var _instance:Red5BootStrapper;
		
		/**
		 * 
		 * 
		 */		
		public function Red5BootStrapper(config:String)
		{
			NetConnection.defaultObjectEncoding = ObjectEncoding.AMF0;
			SharedObject.defaultObjectEncoding = ObjectEncoding.AMF0;
			this._config = config;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public static function getInstance(config:String=null) : Red5BootStrapper {
			
			if(_instance == null) {
				if(config == null) {
					config = "applicationContext.xml";
				} 
				_instance = new Red5BootStrapper(config);
				_instance.loadData();
			}
			
			return _instance;
		}
		
		/**
		 * 
		 * 
		 */		
		public function loadData() : void {
			_objectDefinitionsLoader = new XmlObjectDefinitionsLoader();
			_objectDefinitionsLoader.addEventListener(ObjectDefinitionsLoaderEvent.COMPLETE, onObjectDefinitionsLoaderComplete);
			_objectDefinitionsLoader.load(this._config);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onObjectDefinitionsLoaderComplete(event:ObjectDefinitionsLoaderEvent) : void {
			var container:ObjectContainer = _objectDefinitionsLoader.container;
			_client = container.getObject("client");
			_connection = container.getObject("connection");	
		
			dispatchEvent(new Event("bootStrapComplete"));
			dispatchEvent(new ObjectDefinitionsLoaderEvent(ObjectDefinitionsLoaderEvent.COMPLETE));
		}
		
		/**
		 * 
		 * 
		 */		
		public function connect() : void {
			// Create a Red5Connection which registers the connection
			
			this._connection.connect(this._connection.rtmpURI, this._connection.connectionArgs[0], this._connection.connectionArgs[1]);
			this._connection.addEventListener(Red5Event.CONNECTED, this.onConnection );
			this._connection.addEventListener(Red5Event.DISCONNECTED, this.onDisconnect);
			this._connection.client = this;
		}
		
		/**
		 * 
		 * @param val
		 * 
		 */		
		public function setClientID(val:Number) : void {
			trace("val: " + val);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		private function onConnection(event:Red5Event) : void {
			trace("event: " + event);
			dispatchEvent(event.clone());
		}
		
		/** 
		 * @param event
		 * 
		 */		
		private function onDisconnect(event:Red5Event) : void {
			trace("event: " + event);
			Alert.show("Error Connecting", "Error");
			dispatchEvent(event.clone());
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function get client() : ClientManager {
			return this._client;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function set client(val:ClientManager) : void {
			this._client = val;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function get connection() : Red5Connection {
			return this._connection;
		}
	}
}