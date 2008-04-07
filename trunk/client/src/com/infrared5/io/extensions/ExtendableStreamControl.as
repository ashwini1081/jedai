package com.infrared5.io.extensions
{
	import com.infrared5.io.extensions.enum.ResourceEnum;
	import com.infrared5.io.extensions.utils.ExtensionStatusPool;
	
	/**
	 * Base class for all Classes that want to implement Extensions
	 * 
	 * @author Jon Valliere ( jvalliere@emoten.com )
	 */
	public interface ExtendableStreamControl
	{
		function set extensions( plugins:Array ):void;
		
		function loadExtension( plugin:StreamExtension ):StreamExtension;
		
		function terminateExtension( plugin:StreamExtension ):Boolean;
		
		function suspendExtensions():ExtensionStatusPool;
		
		function terminateExtensions():ExtensionStatusPool;
		
		function startExtensions():ExtensionStatusPool;
		
		function toggleExtensionSuspension():ExtensionStatusPool;
		
		function getExtensions():Object;
		
		function registerExternalResource( resource:ResourceEnum, value:* ):void;
		
		function requestExternalResource( resource:ResourceEnum, callback:Function ):void;
	}
}