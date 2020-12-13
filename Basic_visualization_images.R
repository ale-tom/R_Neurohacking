file <- here::here('data','BRAINIX','NIfTI','Output_3D_file.nii.gz')
nii_T1<-oro.nifti::readNIfTI(file,reorient = FALSE)

d <- dim(nii_T1)

#Visualise one slice
image(1:d[1],1:d[1],nii_T1[, ,11],xlab = '',ylab = '')
graphics::image()
heat.colors(12)
#by default R uses heat colors
#reset in gray scale and show 1 slide
oro.nifti::image(nii_T1,z=11,plot.type ='single')

#show all slices - very slow
oro.nifti::image(nii_T1)

#orthographic view
oro.nifti::orthographic(nii_T1,xyz = c(200,200,11))

#plot on two subplots (1 row 2 columns)
par(mfrow = c(1,2))
#set margins
o<-par(mar=c(4,4,0,0))
#plot distribution of intensities (Note:peaks on 0 because of the
# null values outside of the brain. Peaks disappear once we use a 
# threshold)

hist(nii_T1,breaks = 75,prob=T,xlab='T1 intensities',
     ylab = 'Density', col = rgb(0,0,1,1/2),main='Unthresholded')

hist(nii_T1[nii_T1>20],breaks = 75,prob=T,xlab='T1 intensities > 20',
     ylab = 'Density', col = rgb(0,0,1,1/2),main='Thresholded')


#BACKMAPPING one slice (some sort of thresholding)
#selection criteria
is_btw_300_400 <- (nii_T1>300 & nii_T1<400)
#create a mask for the WM
nii_T1_mask <- nii_T1
nii_T1_mask[!is_btw_300_400] <- NA
oro.nifti::overlay(nii_T1,nii_T1_mask,z=11,plot.type='single')
#multiple slices
oro.nifti::overlay(nii_T1,nii_T1_mask)
#ortographics
oro.nifti::orthographic(nii_T1,nii_T1_mask,xyz=c(200,200,11),
                        text="Image overlaid with mask",
                        text.cex = 1.5)

