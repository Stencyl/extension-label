import com.stencyl.graphics.fonts.Label;
import com.stencyl.models.Actor;
import com.stencyl.models.Font;

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
			
			a.disableActorDrawing();
			a.addChild(l);
			a.setActorValue(LABEL, l);
		}
	}
	
	public static function destroy(a:Actor)
	{
		if(a != null)
		{
			var l = cast(a.getActorValue(LABEL), Label);
			
			if(l != null)
			{
				a.enableActorDrawing();
				a.removeChild(l);
				a.setActorValue(LABEL, null);
			}
		}
	}
	
	public static function setFont(a:Actor, f:Font)
	{
		if(a != null)
		{
			var l = cast(a.getActorValue(LABEL), Label);
			
			if(l != null)
			{
				l.fontScale = 1;
				l.font = f.font;
			}
		}
	}
	
	public static function setText(a:Actor, s:String)
	{
		if(a != null)
		{
			var l = cast(a.getActorValue(LABEL), Label);
			
			if(l != null)
			{
				l.text = s;
			}
		}
	}
	
	public static function enableTextWrap(a:Actor, width:Int)
	{
		if(a != null)
		{
			var l = cast(a.getActorValue(LABEL), Label);
			
			if(l != null)
			{
				l.multiLine = true;
				l.fixedWidth = true;
				l.setWidth(width);
			}
		}
	}
	
	public static function setAlignment(a:Actor, align:Int)
	{
		if(a != null)
		{
			var l = cast(a.getActorValue(LABEL), Label);
			
			if(l != null)
			{
				l.alignment = align;
			}
		}
	}
}