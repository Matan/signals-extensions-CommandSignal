package org.robotlegs.core
{
	import org.osflash.signals.ISignal;
	/**
	 * @author Matan Uberstein
	 */
	public interface ISignalMap
	{
		function add(signal : ISignal, listener : Function, oneShot : Boolean = false) : void

		function remove(signal : ISignal, listener : Function) : void

		function removeAll() : void
	}
}
