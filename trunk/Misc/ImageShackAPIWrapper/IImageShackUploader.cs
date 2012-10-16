using System;
using System.Collections.Generic;
using System.Text;

namespace ImageShackAPIWrapper
{
    public interface IImageShackUploader
    {
        UploadedImageDetails UploadImage(string fileName);

        UploadedImageDetails UploadImage(string fileName, int resizeWidth, int resizeHeight); 
    }
}
