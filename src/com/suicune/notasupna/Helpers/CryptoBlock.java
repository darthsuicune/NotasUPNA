package com.suicune.notasupna.Helpers;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 * Usage:
 * <pre>
 * String crypto = SimpleCrypto.encrypt(cleartext)
 * ...
 * String cleartext = SimpleCrypto.decrypt(crypto)
 * </pre>
 * @author ferenc.hechler
 * @modified by Denis Lapuente
 */

/*
 * This class helps with the management of encryption for the password. This way we can get an encrypted password saved instead of a plain text as the original.
 * It has not been created by me, but actually it has been modified for the project. It would require an external seed to generate the randomizing
 * I've added an static seed because a random one would fail on retrieving the password, an storing the seed in any internal place would actually kill the process of encryption.
 */
public class CryptoBlock {
	/*
	 * Encrypt and decrypt main methods. They get the key for encrypting and send an encrypt/decrypt request the their methods
	 */
        public static String encrypt(String cleartext) throws Exception {
                byte[] rawKey = getRawKey();
                byte[] result = encrypt(rawKey, cleartext.getBytes());
                return toHex(result);
        }
        public static String decrypt(String encrypted) throws Exception {
                byte[] rawKey = getRawKey();
                byte[] encoded = toByte(encrypted);
                byte[] result = decrypt(rawKey, encoded);
                return new String(result);
        }

        /*
         * key generator, with AES - SHA1 encryption. 128 bits for most support, as not every device has 192 and 256 compatibility
         */
        private static byte[] getRawKey() throws Exception {
                KeyGenerator keygen = KeyGenerator.getInstance("AES");
                SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
                sr.setSeed("ho1phwe¥£$⅜’Y3$%←·~½←” ·$t2v$t·~½ ŧV5y“~½¬↓”$%&{dsf gv$%&{roghsajkfv$%&7nbgq  v$%&{$%&7n".getBytes());
            keygen.init(128, sr); 
            SecretKey skey = keygen.generateKey();
            byte[] raw = skey.getEncoded();
            return raw;
        }

        /*
         * encrypt and decrypt internal methods.
         * -Get a Secret key in AES format with the raw key.
         * -Cipher or decipher (with Cipher.encrypt or encrypt mode) and return the result
         */
        private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
                Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            byte[] encrypted = cipher.doFinal(clear);
                return encrypted;
        }
        private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
                Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            byte[] decrypted = cipher.doFinal(encrypted);
                return decrypted;
        }

        /*
         * Helper methods. Used for coding and encoding strings from hex to bytes and back 
         */
        private static byte[] toByte(String hexString) {
                int len = hexString.length()/2;
                byte[] result = new byte[len];
                for (int i = 0; i < len; i++)
                        result[i] = Integer.valueOf(hexString.substring(2*i, 2*i+2), 16).byteValue();
                return result;
        }

        private static String toHex(byte[] buf) {
                if (buf == null)
                        return "";
                StringBuffer result = new StringBuffer(2*buf.length);
                for (int i = 0; i < buf.length; i++) {
                        appendHex(result, buf[i]);
                }
                return result.toString();
        }
        private final static String HEX = "0123456789ABCDEF";
        private static void appendHex(StringBuffer sb, byte b) {
                sb.append(HEX.charAt((b>>4)&0x0f)).append(HEX.charAt(b&0x0f));
        }
        
}