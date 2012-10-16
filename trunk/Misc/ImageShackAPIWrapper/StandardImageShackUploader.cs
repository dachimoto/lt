using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Net;
using System.Xml;

namespace ImageShackAPIWrapper
{
    /// <summary>
    /// Lets a user upload an Image to ImageShack with the option of having the image resized.
    /// </summary>
    public class StandardImageShackUploader : IImageShackUploader
    {
        /// <summary>
        /// Uploads an image to ImageShack.
        /// </summary>
        /// <param name="fileName">The fully qualified path of the file to be uploaded.</param>
        /// <returns>The details of the uploaded image.</returns>
        public UploadedImageDetails UploadImage(string fileName)
        {
            string webPostAddress = "http://iload2.imageshack.us/upload_api.php?swfupload=1&cookie=&optsize=resample&ulevel=&nocache=29632";

            HttpWebResponse imageShackResponse;
            // send our picture off to ImageShack.
            try
            {
                imageShackResponse = SendRequestToImageShack(fileName, webPostAddress);
            }
            catch (FileNotFoundException e)
            {
                throw e;
            }

            Stream responseStream = imageShackResponse.GetResponseStream();
            UploadedImageDetails details;
            // extract the details about the image from the Xml data returned from ImageShack.
            try
            {
                details = ExtractImageDetails(responseStream);
            }
            catch (XmlException e)
            {
                throw e;
            }

            return details;
        }


        /// <summary>
        /// Uploads an image to ImageShack and resizes the image to the specified dimensions.  ImageShack appears to enforce
        /// that resized images retain their initial width/height ratio.  The proportionately smallest of the two dimensions
        /// appears to be the one that imageshack uses to determine the other dimension.  E.g. attempting to resize a
        /// 100px by 100px image to 10px by 75px (or 75px by 10px for that matter) will actually result in an image of 10px by 10px. 
        /// </summary>
        /// <param name="fileName">The fully qualified path of the file to be uploaded.</param>
        /// <param name="resizeWidth">The width the image should be resized to.</param>
        /// <param name="resizeHeight">The height the image should be resized to.</param>
        /// <returns>The details of the uploaded image.</returns>
        /// <exception cref="System.IO.FileNotFoundException">Thrown when the file path provided
        /// doesn't appear to exist.</exception>
        public UploadedImageDetails UploadImage(string fileName, int resizeWidth, int resizeHeight)
        {
            // the address we want to send our image to.  note the query string values.  xml=yes: states
            // that we'd like xml returned, optimage=1: required if we want the image to be resized, optsize=NxM:
            // tells imageshack what size to resize the image to.
            string webPostAddress = "http://www.imageshack.us/index.php?xml=yes&optimage=1&optsize=" + 
                resizeWidth.ToString() + "x" + resizeHeight.ToString();

            HttpWebResponse imageShackResponse;
            // send our picture off to ImageShack.
            try
            {
                imageShackResponse = SendRequestToImageShack(fileName, webPostAddress);
            }
            catch (FileNotFoundException e)
            {
                throw e;
            }

            Stream responseStream = imageShackResponse.GetResponseStream();
            UploadedImageDetails details;
            // extract the details about the image from the Xml data returned from ImageShack.
            try
            {
                details = ExtractImageDetails(responseStream);
            }
            catch (XmlException e)
            {
                throw e;
            }

            return details;
        }


        /// <summary>
        /// Sends a web request to ImageShack containing the contents of the file to be uploaded.
        /// </summary>
        /// <param name="fileName">The fully qualified path of the file to be uploaded.</param>
        /// <param name="webPostAddress">The address that the request should be sent to, 
        /// including any query string parameters</param>
        /// <returns>The response message sent back from ImageShack</returns>
        /// <exception cref="System.IO.FileNotFoundException">Thrown when the specified file path
        /// doesn't appear to exist</exception>
        private HttpWebResponse SendRequestToImageShack(string fileName, string webPostAddress)
        {
            // the request header
            HttpWebRequest imageShackWebRequest = WebRequest.Create(webPostAddress) as HttpWebRequest;
            imageShackWebRequest.Method = "POST";
            string boundary = "----------" + DateTime.Now.Ticks.ToString("x");
            imageShackWebRequest.ContentType = @"multipart/form-data; boundary=" + boundary;

            FileInfo fileToUploadInfo = new FileInfo(fileName);
            if (!fileToUploadInfo.Exists)
            {
                throw new FileNotFoundException("The specified file doesn't seem to exist.", fileName);
            }

            // determine the content type of the file being sent.
            string contentType;
            switch (fileToUploadInfo.Extension.ToLower())
            {
                case ".jpg":
                    contentType = "image/jpg";
                    break;
                case ".jpeg":
                    contentType = "image/jpeg";
                    break;
                case ".gif":
                    contentType = "image/gif";
                    break;
                case ".png":
                    contentType = "image/png";
                    break;
                case ".bmp":
                    contentType = "image/bmp";
                    break;
                case ".tif":
                    contentType = "image/tiff";
                    break;
                case ".tiff":
                    contentType = "image/tiff";
                    break;
                default:
                    contentType = "image/unknown";
                    break;

            }

            // build up the post message header.
            StringBuilder sb = new StringBuilder();
            sb.Append("--");
            sb.Append(boundary);
            sb.Append("\r\n");
            sb.Append("Content-Disposition: form-data; name=\"");
            //sb.Append("fileupload");
            sb.Append("Filedata");
            sb.Append("\"; filename=\"");
            sb.Append(fileToUploadInfo.Name);
            sb.Append("\"");
            sb.Append("\r\n");
            sb.Append("Content-Type: ");
            sb.Append(contentType);
            sb.Append("\r\n");
            sb.Append("\r\n");

            string imagePostHeader = sb.ToString();
            byte[] imagePostHeaderBytes = Encoding.UTF8.GetBytes(imagePostHeader);
            
            // trailing boundary string as a byte array
            byte[] trailingBoundaryBytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

            // get the file as a stream and using this information and previous length information
            // set the content length
            FileStream imageFileStream = new FileStream(fileToUploadInfo.FullName, FileMode.Open, FileAccess.Read);
            imageShackWebRequest.ContentLength = imagePostHeaderBytes.Length + imageFileStream.Length + trailingBoundaryBytes.Length;

            Stream httpRequestStream = imageShackWebRequest.GetRequestStream();

            // write out the post header
            httpRequestStream.Write(imagePostHeaderBytes, 0, imagePostHeaderBytes.Length);

            // write out the file contents
            byte[] imageFileBuffer = new Byte[checked((uint)Math.Min(4096, (int)imageFileStream.Length))];
            int bytesRead = 0;
            while ((bytesRead = imageFileStream.Read(imageFileBuffer, 0, imageFileBuffer.Length)) != 0)
            {
                httpRequestStream.Write(imageFileBuffer, 0, bytesRead);
            }

            // write out the trailing boundary
            httpRequestStream.Write(trailingBoundaryBytes, 0, trailingBoundaryBytes.Length);

            // get ImageShack's response and return it
            HttpWebResponse imageShackWebResponse = imageShackWebRequest.GetResponse() as HttpWebResponse;
            return imageShackWebResponse;
        }


        /// <summary>
        /// Extracts the details about the now uploaded image from the Xml that ImageShack returns.
        /// </summary>
        /// <param name="stream">The sequence of bytes containing the Xml response data.</param>
        /// <returns>The details about the image that has been uploaded.</returns>
        /// <exception cref="System.Xml.XmlException">Thrown when there is trouble interpreting ImageShack's response as
        /// Xml</exception>
        private UploadedImageDetails ExtractImageDetails(Stream stream)
        {
            UploadedImageDetails details = new UploadedImageDetails();

            try
            {
                XmlReader rdr = XmlReader.Create(stream);

                while (rdr.Read())
                {
                    if (rdr.NodeType == XmlNodeType.Element)
                    {
                        switch (rdr.Name)
                        {
                            case "image_link":
                                details.ImageLink = rdr.ReadString();
                                break;
                            case "thumb_link":
                                details.ThumbLink = rdr.ReadString();
                                break;
                            case "ad_link":
                                details.AdLink = rdr.ReadString();
                                break;
                            case "thumb_exists":
                                string thumbExists = rdr.ReadString();
                                if (thumbExists == "no")
                                { details.ThumbExists = false; }
                                else if (thumbExists == "yes")
                                { details.ThumbExists = true; }
                                else
                                { throw new InvalidOperationException(); }
                                break;
                            case "total_raters":
                                details.TotalRaters = rdr.ReadElementContentAsInt();
                                break;
                            case "ave_rating":
                                details.AverageRating = rdr.ReadElementContentAsDouble();
                                break;
                            case "image_location":
                                details.ImageLocation = rdr.ReadString();
                                break;
                            case "thumb_location":
                                details.ThumbLocation = rdr.ReadString();
                                break;
                            case "server":
                                details.Server = rdr.ReadString();
                                break;
                            case "image_name":
                                details.ImageName = rdr.ReadString();
                                break;
                            case "done_page":
                                details.DonePage = rdr.ReadString();
                                break;
                            case "resolution":
                                details.Resolution = rdr.ReadString();
                                break;
                            case "filesize":
                                details.FileSize = rdr.ReadElementContentAsInt();
                                break;
                            case "image_class":
                                details.ImageClass = rdr.ReadString();
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
            catch (XmlException e)
            {
                throw e;
            }

            return details;
        }
    }
}
