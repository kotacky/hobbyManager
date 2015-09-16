package jp.co.wiss1.common;

public class SizeChange {

	public static int SizeChanger(int magazineSize, int dramaSize, int movieSize, int commercialSize) {
		int size = 0;
		if(size < magazineSize){
			size = magazineSize;
		}
		if(size < dramaSize){
			size = dramaSize;
		}
		if(size < movieSize){
			size = movieSize;
		}
		if(size < commercialSize){
			size = commercialSize;
		}

		return size;
	}

}
