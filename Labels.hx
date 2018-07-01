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

			l.cacheParentAnchor = a.cacheAnchor;
			l.set_labelX(0);
			l.set_labelY(0);
			l.updatePosition();

			a.setActorValue(LABEL, l);
		}
	}
	
	public static function destroy(a:Actor)
	{
		if(a != null && a.label != null)
		{
			a.enableActorDrawing();
			a.removeChild(a.label);
			a.label.cacheParentAnchor = Utils.zero;
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
			a.label.set_letterSpacing(f.letterSpacing);
			
			if (f.isBitmapFont())
			{
				a.label.set_lineSpacing(f.font.lineSpacing);
			}
		}
	}
	
	public static function setText(a:Actor, s:String)
	{
		if(a != null && a.label != null)
		{
			a.label.text = s;
			
			if (a.label.stencylFont != null)
			{
				a.label.set_letterSpacing(a.label.stencylFont.letterSpacing);
				
				if (a.label.stencylFont.isBitmapFont())
				{
					a.label.set_lineSpacing(a.label.stencylFont.font.lineSpacing);
				}
			}
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