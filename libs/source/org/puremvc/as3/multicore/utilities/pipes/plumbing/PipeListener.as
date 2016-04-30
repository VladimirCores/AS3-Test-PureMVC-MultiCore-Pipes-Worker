package org.puremvc.as3.multicore.utilities.pipes.plumbing
{
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeFitting;
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeMessage;
		
	/**
	 * Pipe Listener.
	 * <P>
	 * Allows a class that does not implement <code>IPipeFitting</code> to
	 * be the final recipient of the messages in a pipeline.</P>
	 * 
	 * @see Junction
	 */ 
	public class PipeListener implements IPipeFitting
	{
		private var context:Object;
		private var listener:Function;
		private var _pipeName:String;
		private var _id:uint = Pipe.getID();
		
		public function PipeListener( context:Object, listener:Function )
		{
			this.context = context;
			this.listener = listener;
		}
		
		/**
		 *  Can't connect anything beyond this.
		 */
		public function connect(output:IPipeFitting):Boolean
		{
			return false;
		}
	
		/**
		 *  Can't disconnect since you can't connect, either.
		 */
		public function disconnect():IPipeFitting
		{
			return null;
		}
	
		// Write the message to the listener
		public function write(message:IPipeMessage):Boolean
		{
			listener.apply(context,[message]);
			return true;
		}

		public function get pipeName():String { return _pipeName; }
		public function set pipeName(value:String):void { _pipeName = value; }

		public function get id():uint { return _id; }
		public function set id(value:uint):void { _id = value; }
	}
}