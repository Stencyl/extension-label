import com.stencyl.graphics.fonts.Label;
import com.stencyl.models.Actor;
import com.stencyl.models.Font;
import com.stencyl.Engine;
import com.stencyl.utils.Utils;

class Labels
{
	public static var LABEL:String = "label";

	public static function create(a:Actor)
	{
		if(a != null)
		{
			var l = new Label();
			l.multiLine = false;
			l.fixedWidth = false;
			l.fontScale = 3;
			l.useColor = false;
			
			a.disableActorDrawing();
			a.addChild(l);
			a.label = l;

			var p = Utils.getAnchorPoint(a);
			l.labelX = -p.x;
			l.labelY = -p.y;
			
			a.setActorValue(LABEL, l);
		}
	}
	
	public static function destroy(a:Actor)
	{
		if(a != null && a.label != null)
		{
			a.enableActorDrawing();
			a.removeChild(a.label);
			a.label = null;
			
			a.setActorValue(LABEL, null);
		}
	}
	
	public static function setFont(a:Actor, f:Font)
	{
		if(a != null && a.label != null)
		{
			a.label.fontScale = 1;
			a.label.stencylFont = f;
		}
	}
	
	public static function setText(a:Actor, s:String)
	{
		if(a != null && a.label != null)
		{
			a.label.text = s;
		}
	}
	
	public static function enableTextWrap(a:Actor, width:Int)
	{
		if(a != null && a.label != null)
		{
			a.label.multiLine = true;
			a.label.fixedWidth = true;
			a.label.setWidth(Std.int(width * Engine.SCALE));
		}
	}
	
	public static function setAlignment(a:Actor, align:Int)
	{
		if(a != null && a.label != null)
		{
			a.label.alignment = align;
		}
	}
}