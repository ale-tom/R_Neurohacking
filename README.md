# R_Neurohacking

**R_Neurohacking** is a collection of R scripts designed to demonstrate basic  techniques for brain image processing and visualisation. The repository provides examples of how to load, manipulate, and visualise images using R—methods that are useful for exploring neural data and developing reproducible workflows in neuroscience research.

## Overview

This repository includes:
- **Basic_load_write_images.R:** Demonstrates how to import and export brain images in R.
- **Basic_manipulation_images.R:** Provides examples of image manipulation, including cropping, resizing, and simple transformations.
- **Basic_visualization_images.R:** Shows how to generate and customize visualisations of brain image data.
- **Data Folder:** Contains sample images and data files used in the scripts.

The scripts are geared toward neuroimaging applications and data science workflows in neuroscience. They illustrate essential data handling techniques and visual analytical methods that are applicable for basic to intermediate neurohacking projects.

## Requirements

- **R:** Version 4.0 or above.
- **RStudio:** Recommended for an integrated development experience.
- **Packages:** Ensure you have the following packages installed:
  - `magick` for advanced image processing,
  - `ggplot2` for data visualization, and
  - Other dependencies as required by your scripts.

You can install the necessary packages using:
```R
install.packages(c("magick", "ggplot2"))

```

## Usage

1. Open the Neurohacking.Rproj file in RStudio.
2. Review and run individual scripts (e.g., Basic_load_write_images.R) to see example workflows for image processing.
3. Modify the scripts as needed to adapt the methods to your own neuroimaging data.

## Repository Structure
```plaintext
R_Neurohacking/
├── Data/
│   └── (sample images and data files)
├── Basic_load_write_images.R
├── Basic_manipulation_images.R
├── Basic_visualization_images.R
└── Neurohacking.Rproj
```

## Licence
This project is licensed under the MIT License.


