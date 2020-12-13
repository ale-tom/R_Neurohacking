#load MPRAGE image
file <- here::here('Data','kirby21','visit_1','113','113-01-MPRAGE.nii.gz')
T1<-oro.nifti::readNIfTI(file,reorient = FALSE)

#let's have a quick look at it
oro.nifti::orthographic(T1)

#MPRAGE from the same participant/scanner on a different time
file <- here::here('Data','kirby21','visit_2','113','113-02-MPRAGE.nii.gz')
T1_follow<-oro.nifti::readNIfTI(file,reorient = FALSE)

#compare (note: difference is still a NIfTI file)
delta <- T1-T1_follow
#This illustrate the necessity for movement correction/co-registration
#same participant same scanner but large difference between the images
oro.nifti::orthographic(delta)

#TRANSFORMATIONS
# The intensities gradient in the images is an artifact of the way they
# are shown relative to each other.
# The artifact can be removed by applying a Transfer function to improve
# visualization and processing (e.g. segmentation)

par(mar = c(5,4,4,4)+0.3)
col1 = rgb(0,0,1,1/2)
im_hist <- hist(T1,plot=FALSE)
plot(im_hist$mids,im_hist$count, log='y',type ='h',lwd=10,lend=2,col=col1,
     xlab = 'Intensity values', ylab  = 'Count (Log scale)')

#Define a linear spline transfer function (other definitions are possible)
lin.sp <- function(x,knots,slope)
      { knots<-c(min(x),knots,max(x))
        slopeS<-slope[1]
        for(j in 2:length(slope)) {slopeS<-c(slopeS,slope[j]-sum(slopeS))}
        rvals <- numeric(length(x))
        for(i in 2:length(knots)){
          rvals<-ifelse(x>=knots[i-1],slopeS[i-1]*(x-knots[i-1])+rvals,rvals)
        }
        return(rvals)
}
#Define a spline with two knowts and three slopes
knot.vals<-c(.3,.6)
slp.vals <-c(1,.5,.25)
par(new=TRUE)
curve(lin.sp(x,knot.vals,slp.vals),axes=FALSE,
      xlab ='',ylab = '',col=2,lwd=3)
axis(side=4,at=pretty(range(im_hist$mids))/max(T1),
     labels = pretty(range(im_hist$mids)))
mtext("Transformed Intensity", side=4,line=2)

#Being a linear transformation, gray will remain gray, black black, ect. 
#What changes is only the intensity
par(mfrow = c(1,2))
trans_T1 <- lin.sp(T1, knot.vals*max(T1),slp.vals)
oro.nifti::image(T1,z=150,plot.type='single',main="Original image")
oro.nifti::image(trans_T1,z=150,plot.type='single',main="Transformed image")



