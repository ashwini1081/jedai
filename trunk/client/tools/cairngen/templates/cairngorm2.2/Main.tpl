<?xml version="1.0" encoding="utf-8"?>
<!--

Copyright 2005 iteration::two Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

@ignore
-->

<!--
	@version $Revision: 1.21 $
-->
<mx:Application
	xmlns:mx="http://www.adobe.com/2006/mxml" 
	xmlns:control="@namespace.control.*" 
	xmlns:business="com.adobe.cairngorm.samples.store.business.*" 
	xmlns:view="com.adobe.cairngorm.samples.store.view.*" 
	xmlns:details="com.adobe.cairngorm.samples.store.view.productdetails.*" 
	xmlns:cart="com.adobe.cairngorm.samples.store.view.shoppingcart.*" 
	creationComplete="onCreationComplete();" 
	pageTitle="CairngormStore" 
	width="100%" 
	height="100%" 
	styleName="main"
	horizontalAlign="center">
	
	<mx:Script>
	<![CDATA[
		import com.adobe.cairngorm.control.CairngormEventDispatcher;
		import com.adobe.cairngorm.control.CairngormEvent;
		import com.adobe.cairngorm.samples.store.model.ShopModelLocator;
		import com.adobe.cairngorm.samples.store.control.ShopController;
		import com.adobe.cairngorm.samples.store.event.GetProductsEvent;
			
		[Bindable]
		public var model : ShopModelLocator = ShopModelLocator.getInstance();
        
		private function onCreationComplete() : void
		{
			CairngormEventDispatcher.getInstance().dispatchEvent( new CairngormEvent( GetProductsEvent.EVENT_GET_PRODUCTS ) );
		}
																			
	]]>
	</mx:Script>
	
<!-- ========================================================================== -->
	
	<!-- the ServiceLocator where we specify the remote services -->
	<business:Services id="services" />
	
	<!-- the FrontController, containing Commands specific to this appliation -->
	<control:ShopController id="controller" />

<!-- ========================================================================== -->

	<mx:Style source="cairngormstore.css" />
	
	<mx:Label text="Cairngorm Store" styleName="appTitle" />
	
	<mx:HBox width="100%" height="555" horizontalGap="4" horizontalAlign="center">			
			
		<view:BodyPanel title="Product Catalog" width="512" height="100%" />

		<mx:VBox width="370" height="100%">
	
			<details:ProductDetails
				id="productDetailsComp"
				width="100%"
				height="325" 
				selectedItem="{model.selectedItem}" 
				currencyFormatter="{model.currencyFormatter}" />			
				
			<cart:ShoppingCartView
				id="shoppingCartComp"
				width="100%"
				height="100%" 
				shoppingCart="{model.shoppingCart}" 
				selectedItem="{model.selectedItem}" 
				select="model.selectedItem = event.target.selectedItem" 
				currencyFormatter="{model.currencyFormatter}" />			
				
		</mx:VBox>
			
	</mx:HBox>

	<view:CopyrightButton />
	
</mx:Application>
