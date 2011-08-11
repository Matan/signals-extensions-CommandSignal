package org.robotlegs.base
{
	import org.osflash.signals.ISignal;
	import org.robotlegs.core.ISignalMap;

	/**
	 * @author Matan Uberstein
	 */
	public class SignalMap implements ISignalMap
	{
		protected var _mappings : Array;

		public function SignalMap()
		{
			_mappings = [];
		}

		public function add(signal : ISignal, listener : Function, oneShot : Boolean = false) : void
		{
			_mappings.push({signal:signal, listener:listener});
			if(!oneShot)
				signal.add(listener);
			else
				signal.addOnce(listener);
		}

		public function remove(signal : ISignal, listener : Function) : void
		{
			var mapping : Object;
			var i : int = _mappings.length;
			while(i--)
			{
				if(mapping.signal == signal && mapping.listener == listener)
				{
					signal.remove(listener);
					_mappings.splice(i, 1);
					return;
				}
			}
		}

		public function removeAll() : void
		{
			var mapping : Object;
			var signal : ISignal;
			var listener : Function;
			while(mapping = _mappings.pop())
			{
				signal = mapping.signal;
				listener = mapping.listener;
				signal.remove(listener);
			}
		}
	}
}
