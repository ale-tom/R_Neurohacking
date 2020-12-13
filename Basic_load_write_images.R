library(oro.dicom)

#DICOM is how the raw data is stored in the scanner
#read a DICOM slice of a FLAIR image
file <- here::here('data','BRAINIX','DICOM','FLAIR','IM-0001-0001.dcm')
slice = readDICOM(file)
#slice is stored as list consisting  hdr (dataframes) and img (matrices)
class(slice) #class shows what object the variable is

names(slice)

class(slice$hdr[[1]])
class(slice$img[[1]])
dim(slice$img[[1]]) #each slice is 288x288 pixels

hdr <- slice$hdr[[1]]
names(hdr)

#extract resolution: each pixel has size 0.79x0.79mm
hdr[hdr$name == "PixelSpacing", "value"]

#extract flipangle (=4)
hdr[hdr$name == 'FlipAngle',]

# Read all T1 image
file <- here::here('data','BRAINIX','DICOM','T1')
T1_image <- readDICOM(file)

#slices have 512x512 pixels
dim(T1_image$img[[1]])

hdr <- T1_image$hdr[[1]]
#T1 has higher resolution
hdr[hdr$name == "PixelSpacing", "value"]

#NIFTI is a format for data analyses and facilitates dealing with 3D images

#convert DICOM into NIfTI
nii_T1 <- dicom2nifti(T1_image)
class(nii_T1)
d<-dim(nii_T1) #3D matrix

#visualise one slice
image(1:d[1],1:d[2],nii_T1[, , 11], col = gray(0:64/64),
      xlab ="",ylab="")
#write the NIfTI file
file <- here::here('data','BRAINIX','NIfTI','Output_3D_file')
oro.nifti::writeNIfTI(nim=nii_T1,filename=file)
#check
list.files(here::here('data','BRAINIX','NIfTI'),pattern = 'Output_3D_file')

#read another nifti file
#reorient function causes problems so better not to use it
nii_T2 <- oro.nifti::readNIfTI(here::here('data','BRAINIX','NIfTI','T2.nii.gz'),
                               reorient = FALSE)
dim(nii_T2)
