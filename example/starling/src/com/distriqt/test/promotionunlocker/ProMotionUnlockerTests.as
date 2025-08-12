/**
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		11/08/2025
 */
package com.distriqt.test.promotionunlocker
{
	import com.distriqt.extension.promotionunlocker.ProMotionUnlocker;

	import starling.display.Sprite;

	/**
	 */
	public class ProMotionUnlockerTests extends Sprite
	{
		public static const TAG:String = "";

		private var _l:ILogger;

		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//

		public function ProMotionUnlockerTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "ProMotionUnlocker Supported: " + ProMotionUnlocker.isSupported );
				if (ProMotionUnlocker.isSupported)
				{
					log( "ProMotionUnlocker Version:   " + ProMotionUnlocker.service.version );
				}

			}
			catch (e:Error)
			{
				trace( e );
			}
		}


		////////////////////////////////////////////////////////
		//  
		//

		public function setPreferredFramerate():void
		{
			log( "setPreferredFramerate" );
			ProMotionUnlocker.instance.setPreferredFramerate( 120, 60 );
		}


	}
}
