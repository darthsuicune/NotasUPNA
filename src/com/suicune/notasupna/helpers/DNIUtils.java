package com.suicune.notasupna.helpers;

import android.text.TextUtils;

public class DNIUtils {
	/**
	 * Returns if the provided DNI is a valid one. It must have 9 characters and
	 * be one of this formats:
	 * 
	 * XaaaaaaaL 
	 * YaaaaaaaL 
	 * ZaaaaaaaL 
	 * aaaaaaaaL
	 * 
	 * With a-s representing numbers and L a letter. The letter must correspond
	 * to the one in the document and to the numbers
	 * 
	 * It also accepts 7 characters with the same format without the final
	 * letter.
	 * 
	 * WARNING: It's up to the developer to check if it is and then add the
	 * letter to a 7 characters DNI
	 * 
	 * @param dni
	 *            The string to check
	 * @return Whether it is a valid DNI or not
	 */
	public static boolean isValid(String dni) {
		boolean result = false;

		if (dni.length() == 9) {
			if (TextUtils.isDigitsOnly(dni.substring(0, 8)) // Spanish
					&& checkLetter(dni)) {
				result = true;
			} else if (dni.startsWith("X") // Foreigners
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& checkLetter(dni.substring(1, 9))) {
				result = true;
			} else if (dni.startsWith("Y")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& checkLetter("1" + dni.substring(1, 9))) {
				result = true;
			} else if (dni.startsWith("Z")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& checkLetter("2" + dni.substring(1, 9))) {
				result = true;
			}
		} else if (dni.length() == 7) {
			if (TextUtils.isDigitsOnly(dni.substring(0, 8))) { // Spanish
				result = true;
			} else if (dni.startsWith("X") // Foreigners
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))) {
				result = true;
			} else if (dni.startsWith("Y")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))) {
				result = true;
			} else if (dni.startsWith("Z")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))) {
				result = true;
			}
		}
		return result;
	}

	/**
	 * Adds a letter to a previous valid DNI. Throws Exception upon invalid DNI entered
	 * 
	 * @param dni
	 * @return
	 */
	public static String addLetter(String dni) throws Exception{
		return dni + getLetter(dni);
	}

	public static boolean checkLetter(String dni) {
		boolean result = false;
		char letter = dni.charAt(dni.length() - 1);
		if (dni.length() == 9) {
			if (TextUtils.isDigitsOnly(dni.substring(0, 8))
					&& letter == getLetter(dni.substring(0, 8))) {
				result = true;
			} else if (dni.startsWith("X")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& letter == getLetter(dni.substring(1, 8))) {
				result = true;
			} else if (dni.startsWith("Y")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& letter == getLetter(dni.substring(1, 8))) {
				result = true;
			} else if (dni.startsWith("Z")
					&& TextUtils.isDigitsOnly(dni.substring(1, 8))
					&& letter == getLetter(dni.substring(1, 8))) {
				result = true;
			}
		}
		return result;
	}

	public static char getLetter(String dni) {
		char letter = 0;
		int id = Integer.parseInt(dni);
		switch (id % 23) {
		case 0:
			letter = 'T';
			break;
		case 1:
			letter = 'R';
			break;
		case 2:
			letter = 'W';
			break;
		case 3:
			letter = 'A';
			break;
		case 4:
			letter = 'G';
			break;
		case 5:
			letter = 'M';
			break;
		case 6:
			letter = 'Y';
			break;
		case 7:
			letter = 'F';
			break;
		case 8:
			letter = 'P';
			break;
		case 9:
			letter = 'D';
			break;
		case 10:
			letter = 'X';
			break;
		case 11:
			letter = 'B';
			break;
		case 12:
			letter = 'N';
			break;
		case 13:
			letter = 'J';
			break;
		case 14:
			letter = 'Z';
			break;
		case 15:
			letter = 'S';
			break;
		case 16:
			letter = 'Q';
			break;
		case 17:
			letter = 'V';
			break;
		case 18:
			letter = 'H';
			break;
		case 19:
			letter = 'L';
			break;
		case 20:
			letter = 'C';
			break;
		case 21:
			letter = 'K';
			break;
		case 22:
			letter = 'E';
			break;
		default:
			break;
		}
		return letter;
	}
}
