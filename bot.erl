-module(bot).
-compile(export_all).

bot(Msg) ->
	case Msg of
		"Hello!" -> "Hi! How are you?";
		"hello" -> "Hi! How are you?";
		"hello)" -> "Hi! How are you?";
		"Hello." -> "Hi! How are you?";
		"Hello" -> "Hi! How are you?";
		"hi" -> "Hi! How are you?";
		"Hi." -> "Hi! How are you?";
		"Hi" -> "Hi! How are you?";
		"Hi!" -> "Hi! How are you?";
		"Good!"  -> "What are you doing?";
		"Good"  -> "What are you doing?";
		"good"  -> "What are you doing?";
		"good!"  -> "What are you doing?";
		"Cool!"  -> "What are you doing?";
		"Cool"  -> "What are you doing?";
		"cool!"  -> "What are you doing?";
		"cool"  -> "What are you doing?"
	end.
