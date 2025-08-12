/**
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		11/08/2025
 */
package com.distriqt.test.promotionunlocker
{
	import feathers.controls.Button;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.themes.MetalWorksMobileTheme;

	import flash.display.Screen;
	import flash.geom.Rectangle;

	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.utils.Color;

	/**
	 *
	 */
	public class Main extends Sprite implements ILogger
	{
		////////////////////////////////////////////////////////
		//	CONSTANTS
		//


		////////////////////////////////////////////////////////
		//	VARIABLES
		//

		private var _tests:ProMotionUnlockerTests;

		private var _text:TextField;
		private var _container:ScrollContainer;


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//


		/**
		 *  Constructor
		 */
		public function Main()
		{
			super();
			addEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
		}


		public function log( tag:String, message:String ):void
		{
			trace( tag + "::" + message );
			if (_text)
				_text.text = tag + "::" + message + "\n" + _text.text;
		}


		////////////////////////////////////////////////////////
		//	INTERNALS
		//


		private function createUI():void
		{
			var tf:TextFormat = new TextFormat( "_typewriter", 12, Color.WHITE, HorizontalAlign.LEFT, VerticalAlign.TOP );
			_text = new TextField( stage.stageWidth, stage.stageHeight, "", tf );
			_text.y = 40;
			_text.touchable = false;

			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.RIGHT;
			layout.verticalAlign = VerticalAlign.BOTTOM;
			layout.gap = 5;

			var safeArea:Rectangle = Screen.mainScreen.safeArea;
			var margin:int = 40;
			_container = new ScrollContainer();
			_container.y = safeArea.top / Starling.current.contentScaleFactor - margin;
			_container.layout = layout;
			_container.width = safeArea.width / Starling.current.contentScaleFactor;
			_container.height = safeArea.height / Starling.current.contentScaleFactor - 2 * margin;


			_tests = new ProMotionUnlockerTests( this );

			addAction( "Set Preferred Framerate", _tests.setPreferredFramerate );


			addChild( _tests );
			addChild( _text );
			addChild( _container );


			Starling.current.showStats = true;
			Starling.current.showStatsAt( "left", "center" );
		}


		private function addAction( label:String, listener:Function ):void
		{
			var b:Button = new Button();
			b.label = label;
			b.addEventListener( Event.TRIGGERED, listener );
			_container.addChild( b );
		}


		////////////////////////////////////////////////////////
		//	EVENT HANDLERS
		//

		protected function addedToStageHandler( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, addedToStageHandler );
			new MetalWorksMobileTheme();
			createUI();
		}


	}
}