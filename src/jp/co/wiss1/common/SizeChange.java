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

	public static String[] ListChager(int size, String[] changeList){
		String[] changedList = new String[size];
		int i = 0;
		do{
			if(i < changeList.length){
				changedList[i] = changeList[i];
			}else{
				changedList[i] = changedList[i-1];
			}
			i++;
		}while(i < size);

		return changedList;
	}
}
