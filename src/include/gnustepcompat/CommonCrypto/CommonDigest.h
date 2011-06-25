/* This file maps the necessary parts of CommonCrypto to OpenSSL */

#include <openssl/md2.h>
#include <openssl/sha.h>
#include <openssl/hmac.h>

#define CCHmacAlgorithm EVP_MD

#define CC_SHA1_DIGEST_LENGTH SHA_DIGEST_LENGTH


#define kCCHmacAlgSHA1 EVP_sha1()
#define kCCHmacAlgMD5 EVP_md5()
#define kCCHmacAlgSHA256 FIXME
#define kCCHmacAlgSHA384 FIXME
#define kCCHmacAlgSHA224 FIXME
#define kCCHmacAlgSHA512 FIXME

#define CCHmac(alg, key, keylen, data, datalen, macout) HMAC((alg), (key), (keylen), (data), (datalen), (macout), NULL)

#define CC_MD2 MD2
#define CC_MD2_Init MD2_Init
#define CC_MD2_Update MD2_Update
#define CC_MD2_Final MD2_Final
#define CC_MD4 MD4
#define CC_MD4_Init MD4_Init
#define CC_MD4_Update MD4_Update
#define CC_MD4_Final MD4_Final
#define CC_MD5 MD5
#define CC_MD5_Init MD5_Init
#define CC_MD5_Update MD5_Update
#define CC_MD5_Final MD5_Final

#define CC_SHA1 SHA1
#define CC_SHA1_Init SHA1_Init
#define CC_SHA1_Update SHA1_Update
#define CC_SHA1_Final SHA1_Final
#define CC_SHA224 SHA224
#define CC_SHA224_Init SHA224_Init
#define CC_SHA224_Update SHA224_Update
#define CC_SHA224_Final SHA224_Final
#define CC_SHA256 SHA256
#define CC_SHA256_Init SHA256_Init
#define CC_SHA256_Update SHA256_Update
#define CC_SHA256_Final SHA256_Final
#define CC_SHA384 SHA384
#define CC_SHA384_Init SHA384_Init
#define CC_SHA384_Update SHA384_Update
#define CC_SHA384_Final SHA384_Final
#define CC_SHA512 SHA512
#define CC_SHA512_Init SHA512_Init
#define CC_SHA512_Update SHA512_Update
#define CC_SHA512_Final SHA512_Final
