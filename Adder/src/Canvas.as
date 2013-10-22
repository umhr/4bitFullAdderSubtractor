package  
{
	
	import com.bit101.components.CheckBox;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author umhr
	 */
	public class Canvas extends Sprite 
	{
		private var inCB0List:Array/*CheckBox*/ = [];
		private var inCB1List:Array/*CheckBox*/ = [];
		private var outCB1List:Array/*CheckBox*/ = [];
		private var _in0Label:Label;
		private var _in1Label:Label;
		private var _outLabel:Label;
		private var _pushButton:PushButton;
		
		public function Canvas() 
		{
			init();
		}
		private function init():void 
		{
			if (stage) onInit();
			else addEventListener(Event.ADDED_TO_STAGE, onInit);
		}

		private function onInit(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			// entry point
			
			var r:Object = Adder.full(false, true, false);
			
			trace(r.s, r.c);
			
			var n:int = 4;
			for (var i:int = 0; i < n; i++) 
			{
				inCB0List.push(new CheckBox(this, 200 - i * 30, 50, "", onInput));
				inCB1List.push(new CheckBox(this, 200 - i * 30, 100, "", onInput));
				outCB1List.push(new CheckBox(this, 200 - i * 30, 150, "", onInput));
			}
			
			_in0Label = new Label(this, 230, 50 - 5, "");
			_in1Label = new Label(this, 230, 100 - 5, "");
			_outLabel = new Label(this, 230, 150 - 5, "");
			
			new Label(this, 157, 125, "||");
			_pushButton = new PushButton(this, 110, 70, "Add", onMouseClick);
			
			onInput(null);
		}
		
		private function onMouseClick(e:Event):void 
		{
			if (_pushButton.label == "Add") {
				_pushButton.label = "Subtraction";
			}else {
				_pushButton.label = "Add";
			}
			onInput(null);
		}
		private function onInput(e:Event):void {
			calc(_pushButton.label == "Add");
		}
		
		private function calc(isAdd:Boolean):void 
		{
			var in0:String = "";
			var in1:String = "";
			var out:String = "";
			var cx:Boolean = !isAdd;
			var n:int = inCB0List.length;
			for (var i:int = 0; i < n; i++) 
			{
				var inCB1:Boolean = isAdd?inCB1List[i].selected: !inCB1List[i].selected;
				var r:Object = Adder.full(inCB0List[i].selected, inCB1, cx);
				cx = r.c;
				outCB1List[i].selected = r.s;
				in0 = (inCB0List[i].selected?"1":"0") + in0;
				in1 = (inCB1List[i].selected?"1":"0") + in1;
				out = (outCB1List[i].selected?"1":"0") + out;
				
			}
			
			_in0Label.text = "Binary:" + in0 + ", uint:" + parseInt(in0, 2);
			if (in0.substr(0,1) == "0") {
				_in0Label.text += ", int:" + parseInt(in0.substr(1), 2);
			}else {
				_in0Label.text += ", int:" + (parseInt(in0.substr(1), 2) - 8);
			}
			
			_in1Label.text = "Binary:" + in1 + ", uint:" + parseInt(in1, 2);
			if (in1.substr(0,1) == "0") {
				_in1Label.text += ", int:" + parseInt(in1.substr(1), 2);
			}else {
				_in1Label.text += ", int:" + (parseInt(in1.substr(1), 2) - 8);
			}
			
			_outLabel.text = "Binary:" + out + ", uint:" + parseInt(out, 2);
			if (out.substr(0,1) == "0") {
				_outLabel.text += ", int:" + parseInt(out.substr(1), 2);
			}else {
				_outLabel.text += ", int:" + (parseInt(out.substr(1), 2) - 8);
			}
		}
		
	}
	
}