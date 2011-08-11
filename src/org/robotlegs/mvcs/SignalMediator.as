package org.robotlegs.mvcs
{
	import org.robotlegs.base.SignalMap;
	import org.robotlegs.core.ISignalMap;

	/**
	 * @author Matan Uberstein
	 */
	public class SignalMediator extends Mediator
	{
		protected var _signalMap : ISignalMap;

		public function SignalMediator()
		{
		}

		override public function preRemove() : void
		{
			if(_signalMap)
				_signalMap.removeAll();
			super.preRemove();
		}

		protected function get signalMap() : ISignalMap
		{
			return _signalMap || (_signalMap = new SignalMap());
		}
	}
}
