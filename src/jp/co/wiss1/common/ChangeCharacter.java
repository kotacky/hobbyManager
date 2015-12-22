package jp.co.wiss1.common;

//特殊な文字をエスケープ文字に置き換えるクラス
//XSS、SQLインジェクション対策
public class ChangeCharacter {
	public static String CC(String inputData){
		if(!"".equals(inputData) && null != inputData){
			inputData = inputData.replaceAll("&", "&amp;");
			inputData = inputData.replaceAll("<", "&lt;");
			inputData = inputData.replaceAll(">", "&gt;");
			inputData = inputData.replaceAll("\"", "&quot;");
			inputData = inputData.replaceAll("'", "&apos;");
			return inputData;
		}else{
			return inputData;
		}
	}
}
