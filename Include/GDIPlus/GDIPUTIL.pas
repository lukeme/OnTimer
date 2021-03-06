{******************************************************************}
{ GDI+ Util                                                         }
{                                                                  }
{ home page : http://www.progdigy.com                              }
{ email     : hgourvest@progdigy.com                               }
{                                                                  }
{ date      : 15-02-2002                                           }
{                                                                  }
{ The contents of this file are used with permission, subject to   }
{ the Mozilla Public License Version 1.1 (the "License"); you may  }
{ not use this file except in compliance with the License. You may }
{ obtain a copy of the License at                                  }
{ http://www.mozilla.org/MPL/MPL-1.1.html                          }
{                                                                  }
{ Software distributed under the License is distributed on an      }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied. See the License for the specific language governing     }
{ rights and limitations under the License.                        }
{                                                                  }
{ *****************************************************************}

unit GDIPUTIL;

interface
uses
  windows,
  GDIPAPI,
  GDIPOBJ;

function ValueTypeFromULONG(type_: ULONG): string;
function GetMetaDataIDString(id: ULONG): string;
function GetEncoderClsid(Format: string; out pClsid: TGUID): Integer;
function GetStatus(Stat: TStatus): string;
function PixelFormatString(PixelFormat: TPixelFormat): string;

{from WinNT.h}
// creates a language identifier from a primary language identifier and a
// sublanguage identifier for the TStringFormat & TFontFamily class.
function MakeLangID(PrimaryLanguage, SubLanguage: LANGID): Word;

implementation

function ValueTypeFromULONG(type_: ULONG): string;
begin
  case type_ of
    0: Result := 'Nothing';
    1: Result := 'PropertyTagTypeByte';
    2: Result := 'PropertyTagTypeASCII';
    3: Result := 'PropertyTagTypeShort';
    4: Result := 'PropertyTagTypeLong';
    5: Result := 'PropertyTagTypeRational';
    6: Result := 'Nothing';
    7: Result := 'PropertyTagTypeUndefined';
    8: Result := 'Nothing';
    9: Result := 'PropertyTagTypeSLONG';
    10: Result := 'PropertyTagTypeSRational';
  else
    Result := '<UnKnown>';
  end;
end;

function GetMetaDataIDString(id: ULONG): string;
begin
  case id of
    PropertyTagExifIFD: Result := 'PropertyTagExifIFD';
    PropertyTagGpsIFD: Result := 'PropertyTagGpsIFD';
    PropertyTagNewSubfileType: Result := 'PropertyTagNewSubfileType';
    PropertyTagSubfileType: Result := 'PropertyTagSubfileType';
    PropertyTagImageWidth: Result := 'PropertyTagImageWidth';
    PropertyTagImageHeight: Result := 'PropertyTagImageHeight';
    PropertyTagBitsPerSample: Result := 'PropertyTagBitsPerSample';
    PropertyTagCompression: Result := 'PropertyTagCompression';
    PropertyTagPhotometricInterp: Result := 'PropertyTagPhotometricInterp';
    PropertyTagThreshHolding: Result := 'PropertyTagThreshHolding';
    PropertyTagCellWidth: Result := 'PropertyTagCellWidth';
    PropertyTagCellHeight: Result := 'PropertyTagCellHeight';
    PropertyTagFillOrder: Result := 'PropertyTagFillOrder';
    PropertyTagDocumentName: Result := 'PropertyTagDocumentName';
    PropertyTagImageDescription: Result := 'PropertyTagImageDescription';
    PropertyTagEquipMake: Result := 'PropertyTagEquipMake';
    PropertyTagEquipModel: Result := 'PropertyTagEquipModel';
    PropertyTagStripOffsets: Result := 'PropertyTagStripOffsets';
    PropertyTagOrientation: Result := 'PropertyTagOrientation';
    PropertyTagSamplesPerPixel: Result := 'PropertyTagSamplesPerPixel';
    PropertyTagRowsPerStrip: Result := 'PropertyTagRowsPerStrip';
    PropertyTagStripBytesCount: Result := 'PropertyTagStripBytesCount';
    PropertyTagMinSampleValue: Result := 'PropertyTagMinSampleValue';
    PropertyTagMaxSampleValue: Result := 'PropertyTagMaxSampleValue';
    PropertyTagXResolution: Result := 'PropertyTagXResolution';
    PropertyTagYResolution: Result := 'PropertyTagYResolution';
    PropertyTagPlanarConfig: Result := 'PropertyTagPlanarConfig';
    PropertyTagPageName: Result := 'PropertyTagPageName';
    PropertyTagXPosition: Result := 'PropertyTagXPosition';
    PropertyTagYPosition: Result := 'PropertyTagYPosition';
    PropertyTagFreeOffset: Result := 'PropertyTagFreeOffset';
    PropertyTagFreeByteCounts: Result := 'PropertyTagFreeByteCounts';
    PropertyTagGrayResponseUnit: Result := 'PropertyTagGrayResponseUnit';
    PropertyTagGrayResponseCurve: Result := 'PropertyTagGrayResponseCurve';
    PropertyTagT4Option: Result := 'PropertyTagT4Option';
    PropertyTagT6Option: Result := 'PropertyTagT6Option';
    PropertyTagResolutionUnit: Result := 'PropertyTagResolutionUnit';
    PropertyTagPageNumber: Result := 'PropertyTagPageNumber';
    PropertyTagTransferFuncition: Result := 'PropertyTagTransferFuncition';
    PropertyTagSoftwareUsed: Result := 'PropertyTagSoftwareUsed';
    PropertyTagDateTime: Result := 'PropertyTagDateTime';
    PropertyTagArtist: Result := 'PropertyTagArtist';
    PropertyTagHostComputer: Result := 'PropertyTagHostComputer';
    PropertyTagPredictor: Result := 'PropertyTagPredictor';
    PropertyTagWhitePoint: Result := 'PropertyTagWhitePoint';
    PropertyTagPrimaryChromaticities: Result := 'PropertyTagPrimaryChromaticities';
    PropertyTagColorMap: Result := 'PropertyTagColorMap';
    PropertyTagHalftoneHints: Result := 'PropertyTagHalftoneHints';
    PropertyTagTileWidth: Result := 'PropertyTagTileWidth';
    PropertyTagTileLength: Result := 'PropertyTagTileLength';
    PropertyTagTileOffset: Result := 'PropertyTagTileOffset';
    PropertyTagTileByteCounts: Result := 'PropertyTagTileByteCounts';
    PropertyTagInkSet: Result := 'PropertyTagInkSet';
    PropertyTagInkNames: Result := 'PropertyTagInkNames';
    PropertyTagNumberOfInks: Result := 'PropertyTagNumberOfInks';
    PropertyTagDotRange: Result := 'PropertyTagDotRange';
    PropertyTagTargetPrinter: Result := 'PropertyTagTargetPrinter';
    PropertyTagExtraSamples: Result := 'PropertyTagExtraSamples';
    PropertyTagSampleFormat: Result := 'PropertyTagSampleFormat';
    PropertyTagSMinSampleValue: Result := 'PropertyTagSMinSampleValue';
    PropertyTagSMaxSampleValue: Result := 'PropertyTagSMaxSampleValue';
    PropertyTagTransferRange: Result := 'PropertyTagTransferRange';
    PropertyTagJPEGProc: Result := 'PropertyTagJPEGProc';
    PropertyTagJPEGInterFormat: Result := 'PropertyTagJPEGInterFormat';
    PropertyTagJPEGInterLength: Result := 'PropertyTagJPEGInterLength';
    PropertyTagJPEGRestartInterval: Result := 'PropertyTagJPEGRestartInterval';
    PropertyTagJPEGLosslessPredictors: Result := 'PropertyTagJPEGLosslessPredictors';
    PropertyTagJPEGPointTransforms: Result := 'PropertyTagJPEGPointTransforms';
    PropertyTagJPEGQTables: Result := 'PropertyTagJPEGQTables';
    PropertyTagJPEGDCTables: Result := 'PropertyTagJPEGDCTables';
    PropertyTagJPEGACTables: Result := 'PropertyTagJPEGACTables';
    PropertyTagYCbCrCoefficients: Result := 'PropertyTagYCbCrCoefficients';
    PropertyTagYCbCrSubsampling: Result := 'PropertyTagYCbCrSubsampling';
    PropertyTagYCbCrPositioning: Result := 'PropertyTagYCbCrPositioning';
    PropertyTagREFBlackWhite: Result := 'PropertyTagREFBlackWhite';
    PropertyTagICCProfile: Result := 'PropertyTagICCProfile';
    PropertyTagGamma: Result := 'PropertyTagGamma';
    PropertyTagICCProfileDescriptor: Result := 'PropertyTagICCProfileDescriptor';
    PropertyTagSRGBRenderingIntent: Result := 'PropertyTagSRGBRenderingIntent';
    PropertyTagImageTitle: Result := 'PropertyTagImageTitle';
    PropertyTagCopyright: Result := 'PropertyTagCopyright';
    PropertyTagResolutionXUnit: Result := 'PropertyTagResolutionXUnit';
    PropertyTagResolutionYUnit: Result := 'PropertyTagResolutionYUnit';
    PropertyTagResolutionXLengthUnit: Result := 'PropertyTagResolutionXLengthUnit';
    PropertyTagResolutionYLengthUnit: Result := 'PropertyTagResolutionYLengthUnit';
    PropertyTagPrintFlags: Result := 'PropertyTagPrintFlags';
    PropertyTagPrintFlagsVersion: Result := 'PropertyTagPrintFlagsVersion';
    PropertyTagPrintFlagsCrop: Result := 'PropertyTagPrintFlagsCrop';
    PropertyTagPrintFlagsBleedWidth: Result := 'PropertyTagPrintFlagsBleedWidth';
    PropertyTagPrintFlagsBleedWidthScale: Result := 'PropertyTagPrintFlagsBleedWidthScale';
    PropertyTagHalftoneLPI: Result := 'PropertyTagHalftoneLPI';
    PropertyTagHalftoneLPIUnit: Result := 'PropertyTagHalftoneLPIUnit';
    PropertyTagHalftoneDegree: Result := 'PropertyTagHalftoneDegree';
    PropertyTagHalftoneShape: Result := 'PropertyTagHalftoneShape';
    PropertyTagHalftoneMisc: Result := 'PropertyTagHalftoneMisc';
    PropertyTagHalftoneScreen: Result := 'PropertyTagHalftoneScreen';
    PropertyTagJPEGQuality: Result := 'PropertyTagJPEGQuality';
    PropertyTagGridSize: Result := 'PropertyTagGridSize';
    PropertyTagThumbnailFormat: Result := 'PropertyTagThumbnailFormat';
    PropertyTagThumbnailWidth: Result := 'PropertyTagThumbnailWidth';
    PropertyTagThumbnailHeight: Result := 'PropertyTagThumbnailHeight';
    PropertyTagThumbnailColorDepth: Result := 'PropertyTagThumbnailColorDepth';
    PropertyTagThumbnailPlanes: Result := 'PropertyTagThumbnailPlanes';
    PropertyTagThumbnailRawBytes: Result := 'PropertyTagThumbnailRawBytes';
    PropertyTagThumbnailSize: Result := 'PropertyTagThumbnailSize';
    PropertyTagThumbnailCompressedSize: Result := 'PropertyTagThumbnailCompressedSize';
    PropertyTagColorTransferFunction: Result := 'PropertyTagColorTransferFunction';
    PropertyTagThumbnailData: Result := 'PropertyTagThumbnailData';
    PropertyTagThumbnailImageWidth: Result := 'PropertyTagThumbnailImageWidth';
    PropertyTagThumbnailImageHeight: Result := 'PropertyTagThumbnailImageHeight';
    PropertyTagThumbnailBitsPerSample: Result := 'PropertyTagThumbnailBitsPerSample';
    PropertyTagThumbnailCompression: Result := 'PropertyTagThumbnailCompression';
    PropertyTagThumbnailPhotometricInterp: Result := 'PropertyTagThumbnailPhotometricInterp';
    PropertyTagThumbnailImageDescription: Result := 'PropertyTagThumbnailImageDescription';
    PropertyTagThumbnailEquipMake: Result := 'PropertyTagThumbnailEquipMake';
    PropertyTagThumbnailEquipModel: Result := 'PropertyTagThumbnailEquipModel';
    PropertyTagThumbnailStripOffsets: Result := 'PropertyTagThumbnailStripOffsets';
    PropertyTagThumbnailOrientation: Result := 'PropertyTagThumbnailOrientation';
    PropertyTagThumbnailSamplesPerPixel: Result := 'PropertyTagThumbnailSamplesPerPixel';
    PropertyTagThumbnailRowsPerStrip: Result := 'PropertyTagThumbnailRowsPerStrip';
    PropertyTagThumbnailStripBytesCount: Result := 'PropertyTagThumbnailStripBytesCount';
    PropertyTagThumbnailResolutionX: Result := 'PropertyTagThumbnailResolutionX';
    PropertyTagThumbnailResolutionY: Result := 'PropertyTagThumbnailResolutionY';
    PropertyTagThumbnailPlanarConfig: Result := 'PropertyTagThumbnailPlanarConfig';
    PropertyTagThumbnailResolutionUnit: Result := 'PropertyTagThumbnailResolutionUnit';
    PropertyTagThumbnailTransferFunction: Result := 'PropertyTagThumbnailTransferFunction';
    PropertyTagThumbnailSoftwareUsed: Result := 'PropertyTagThumbnailSoftwareUsed';
    PropertyTagThumbnailDateTime: Result := 'PropertyTagThumbnailDateTime';
    PropertyTagThumbnailArtist: Result := 'PropertyTagThumbnailArtist';
    PropertyTagThumbnailWhitePoint: Result := 'PropertyTagThumbnailWhitePoint';
    PropertyTagThumbnailPrimaryChromaticities: Result := 'PropertyTagThumbnailPrimaryChromaticities';
    PropertyTagThumbnailYCbCrCoefficients: Result := 'PropertyTagThumbnailYCbCrCoefficients';
    PropertyTagThumbnailYCbCrSubsampling: Result := 'PropertyTagThumbnailYCbCrSubsampling';
    PropertyTagThumbnailYCbCrPositioning: Result := 'PropertyTagThumbnailYCbCrPositioning';
    PropertyTagThumbnailRefBlackWhite: Result := 'PropertyTagThumbnailRefBlackWhite';
    PropertyTagThumbnailCopyRight: Result := 'PropertyTagThumbnailCopyRight';
    PropertyTagLuminanceTable: Result := 'PropertyTagLuminanceTable';
    PropertyTagChrominanceTable: Result := 'PropertyTagChrominanceTable';
    PropertyTagFrameDelay: Result := 'PropertyTagFrameDelay';
    PropertyTagLoopCount: Result := 'PropertyTagLoopCount';
    PropertyTagPixelUnit: Result := 'PropertyTagPixelUnit';
    PropertyTagPixelPerUnitX: Result := 'PropertyTagPixelPerUnitX';
    PropertyTagPixelPerUnitY: Result := 'PropertyTagPixelPerUnitY';
    PropertyTagPaletteHistogram: Result := 'PropertyTagPaletteHistogram';
    PropertyTagExifExposureTime: Result := 'PropertyTagExifExposureTime';
    PropertyTagExifFNumber: Result := 'PropertyTagExifFNumber';
    PropertyTagExifExposureProg: Result := 'PropertyTagExifExposureProg';
    PropertyTagExifSpectralSense: Result := 'PropertyTagExifSpectralSense';
    PropertyTagExifISOSpeed: Result := 'PropertyTagExifISOSpeed';
    PropertyTagExifOECF: Result := 'PropertyTagExifOECF';
    PropertyTagExifVer: Result := 'PropertyTagExifVer';
    PropertyTagExifDTOrig: Result := 'PropertyTagExifDTOrig';
    PropertyTagExifDTDigitized: Result := 'PropertyTagExifDTDigitized';
    PropertyTagExifCompConfig: Result := 'PropertyTagExifCompConfig';
    PropertyTagExifCompBPP: Result := 'PropertyTagExifCompBPP';
    PropertyTagExifShutterSpeed: Result := 'PropertyTagExifShutterSpeed';
    PropertyTagExifAperture: Result := 'PropertyTagExifAperture';
    PropertyTagExifBrightness: Result := 'PropertyTagExifBrightness';
    PropertyTagExifExposureBias: Result := 'PropertyTagExifExposureBias';
    PropertyTagExifMaxAperture: Result := 'PropertyTagExifMaxAperture';
    PropertyTagExifSubjectDist: Result := 'PropertyTagExifSubjectDist';
    PropertyTagExifMeteringMode: Result := 'PropertyTagExifMeteringMode';
    PropertyTagExifLightSource: Result := 'PropertyTagExifLightSource';
    PropertyTagExifFlash: Result := 'PropertyTagExifFlash';
    PropertyTagExifFocalLength: Result := 'PropertyTagExifFocalLength';
    PropertyTagExifMakerNote: Result := 'PropertyTagExifMakerNote';
    PropertyTagExifUserComment: Result := 'PropertyTagExifUserComment';
    PropertyTagExifDTSubsec: Result := 'PropertyTagExifDTSubsec';
    PropertyTagExifDTOrigSS: Result := 'PropertyTagExifDTOrigSS';
    PropertyTagExifDTDigSS: Result := 'PropertyTagExifDTDigSS';
    PropertyTagExifFPXVer: Result := 'PropertyTagExifFPXVer';
    PropertyTagExifColorSpace: Result := 'PropertyTagExifColorSpace';
    PropertyTagExifPixXDim: Result := 'PropertyTagExifPixXDim';
    PropertyTagExifPixYDim: Result := 'PropertyTagExifPixYDim';
    PropertyTagExifRelatedWav: Result := 'PropertyTagExifRelatedWav';
    PropertyTagExifInterop: Result := 'PropertyTagExifInterop';
    PropertyTagExifFlashEnergy: Result := 'PropertyTagExifFlashEnergy';
    PropertyTagExifSpatialFR: Result := 'PropertyTagExifSpatialFR';
    PropertyTagExifFocalXRes: Result := 'PropertyTagExifFocalXRes';
    PropertyTagExifFocalYRes: Result := 'PropertyTagExifFocalYRes';
    PropertyTagExifFocalResUnit: Result := 'PropertyTagExifFocalResUnit';
    PropertyTagExifSubjectLoc: Result := 'PropertyTagExifSubjectLoc';
    PropertyTagExifExposureIndex: Result := 'PropertyTagExifExposureIndex';
    PropertyTagExifSensingMethod: Result := 'PropertyTagExifSensingMethod';
    PropertyTagExifFileSource: Result := 'PropertyTagExifFileSource';
    PropertyTagExifSceneType: Result := 'PropertyTagExifSceneType';
    PropertyTagExifCfaPattern: Result := 'PropertyTagExifCfaPattern';
    PropertyTagGpsVer: Result := 'PropertyTagGpsVer';
    PropertyTagGpsLatitudeRef: Result := 'PropertyTagGpsLatitudeRef';
    PropertyTagGpsLatitude: Result := 'PropertyTagGpsLatitude';
    PropertyTagGpsLongitudeRef: Result := 'PropertyTagGpsLongitudeRef';
    PropertyTagGpsLongitude: Result := 'PropertyTagGpsLongitude';
    PropertyTagGpsAltitudeRef: Result := 'PropertyTagGpsAltitudeRef';
    PropertyTagGpsAltitude: Result := 'PropertyTagGpsAltitude';
    PropertyTagGpsGpsTime: Result := 'PropertyTagGpsGpsTime';
    PropertyTagGpsGpsSatellites: Result := 'PropertyTagGpsGpsSatellites';
    PropertyTagGpsGpsStatus: Result := 'PropertyTagGpsGpsStatus';
    PropertyTagGpsGpsMeasureMode: Result := 'PropertyTagGpsGpsMeasureMode';
    PropertyTagGpsGpsDop: Result := 'PropertyTagGpsGpsDop';
    PropertyTagGpsSpeedRef: Result := 'PropertyTagGpsSpeedRef';
    PropertyTagGpsSpeed: Result := 'PropertyTagGpsSpeed';
    PropertyTagGpsTrackRef: Result := 'PropertyTagGpsTrackRef';
    PropertyTagGpsTrack: Result := 'PropertyTagGpsTrack';
    PropertyTagGpsImgDirRef: Result := 'PropertyTagGpsImgDirRef';
    PropertyTagGpsImgDir: Result := 'PropertyTagGpsImgDir';
    PropertyTagGpsMapDatum: Result := 'PropertyTagGpsMapDatum';
    PropertyTagGpsDestLatRef: Result := 'PropertyTagGpsDestLatRef';
    PropertyTagGpsDestLat: Result := 'PropertyTagGpsDestLat';
    PropertyTagGpsDestLongRef: Result := 'PropertyTagGpsDestLongRef';
    PropertyTagGpsDestLong: Result := 'PropertyTagGpsDestLong';
    PropertyTagGpsDestBearRef: Result := 'PropertyTagGpsDestBearRef';
    PropertyTagGpsDestBear: Result := 'PropertyTagGpsDestBear';
    PropertyTagGpsDestDistRef: Result := 'PropertyTagGpsDestDistRef';
    PropertyTagGpsDestDist: Result := 'PropertyTagGpsDestDist';
  else
    Result := '<UnKnown>';
  end;
end;

function GetEncoderClsid(Format: string; out pClsid: TGUID): Integer;
var
  num, size, j: UINT;
  ImageCodecInfo: PImageCodecInfo;
type
  ArrIMgInf = array of TImageCodecInfo;
begin
  num := 0; // number of image encoders
  size := 0; // size of the image encoder array in bytes
  Result := -1;

  GetImageEncodersSize(num, size);
  if (size = 0) then exit;

  getmem(ImageCodecInfo, size);
  if (ImageCodecInfo = nil) then exit;

  GetImageEncoders(num, size, ImageCodecInfo);

  for j := 0 to num - 1 do begin
    if (ArrIMgInf(ImageCodecInfo)[j].MimeType = Format) then begin
      pClsid := ArrIMgInf(ImageCodecInfo)[j].Clsid;
      Result := j; // Success
    end;
  end;
  freemem(ImageCodecInfo, size);
end;

function GetStatus(Stat: TStatus): string;
begin
  case Stat of
    Ok: Result := 'Ok';
    GenericError: Result := 'GenericError';
    InvalidParameter: Result := 'InvalidParameter';
    OutOfMemory: Result := 'OutOfMemory';
    ObjectBusy: Result := 'ObjectBusy';
    InsufficientBuffer: Result := 'InsufficientBuffer';
    NotImplemented: Result := 'NotImplemented';
    Win32Error: Result := 'Win32Error';
    WrongState: Result := 'WrongState';
    Aborted: Result := 'Aborted';
    FileNotFound: Result := 'FileNotFound';
    ValueOverflow: Result := 'ValueOverflow';
    AccessDenied: Result := 'AccessDenied';
    UnknownImageFormat: Result := 'UnknownImageFormat';
    FontFamilyNotFound: Result := 'FontFamilyNotFound';
    FontStyleNotFound: Result := 'FontStyleNotFound';
    NotTrueTypeFont: Result := 'NotTrueTypeFont';
    UnsupportedGdiplusVersion: Result := 'UnsupportedGdiplusVersion';
    GdiplusNotInitialized: Result := 'GdiplusNotInitialized';
    PropertyNotFound: Result := 'PropertyNotFound';
    PropertyNotSupported: Result := 'PropertyNotSupported';
  else
    Result := '<UnKnown>';
  end;
end;

function PixelFormatString(PixelFormat: TPixelFormat): string;
begin
  case PixelFormat of
    PixelFormatIndexed: Result := 'PixelFormatIndexed';
    PixelFormatGDI: Result := 'PixelFormatGDI';
    PixelFormatAlpha: Result := 'PixelFormatAlpha';
    PixelFormatPAlpha: Result := 'PixelFormatPAlpha';
    PixelFormatExtended: Result := 'PixelFormatExtended';
    PixelFormatCanonical: Result := 'PixelFormatCanonical';
    PixelFormatUndefined: Result := 'PixelFormatUndefined';
    PixelFormat1bppIndexed: Result := 'PixelFormat1bppIndexed';
    PixelFormat4bppIndexed: Result := 'PixelFormat4bppIndexed';
    PixelFormat8bppIndexed: Result := 'PixelFormat8bppIndexed';
    PixelFormat16bppGrayScale: Result := 'PixelFormat16bppGrayScale';
    PixelFormat16bppRGB555: Result := 'PixelFormat16bppRGB555';
    PixelFormat16bppRGB565: Result := 'PixelFormat16bppRGB565';
    PixelFormat16bppARGB1555: Result := 'PixelFormat16bppARGB1555';
    PixelFormat24bppRGB: Result := 'PixelFormat24bppRGB';
    PixelFormat32bppRGB: Result := 'PixelFormat32bppRGB';
    PixelFormat32bppARGB: Result := 'PixelFormat32bppARGB';
    PixelFormat32bppPARGB: Result := 'PixelFormat32bppPARGB';
    PixelFormat48bppRGB: Result := 'PixelFormat48bppRGB';
    PixelFormat64bppARGB: Result := 'PixelFormat64bppARGB';
    PixelFormat64bppPARGB: Result := 'PixelFormat64bppPARGB';
    PixelFormatMax: Result := 'PixelFormatMax';
  else
    Result := '<UnKnown>';
  end;
end;

function MakeLangID(PrimaryLanguage, SubLanguage: LANGID): Word;
begin
  Result := (SubLanguage shl 10) or PrimaryLanguage;
end;

end.
