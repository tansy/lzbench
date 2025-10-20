#ifndef QUICKLZ_ZIP
#define QUICKLZ_ZIP

namespace quicklz_zip
{
    unsigned int deflate(unsigned char *source, unsigned char *destination, unsigned int bitoffset, unsigned int size, unsigned int last);
} // namespace quicklz_zip

#endif // #ifndef QUICKLZ_ZIP
