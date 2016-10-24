# DataScience Course3 Week4
This repo is created to cover the needs of Coursera DataScience specialization, Course 3 Week 4.

#### Content of the Repository
- [**CODEBOOK.md**](https://github.com/ZingerDerGOD/DSC_C3_W4/CODEBOOK.md): Definition of variables in a dataset, returned by run_analysis function.
- [**run_analysis.R**](https://github.com/ZingerDerGOD/DSC_C3_W4/run_analysis.R): Script that contains a solution to Peer-grated assignment of Week 4 Course 3.

##[**run_analysis.R**](https://github.com/ZingerDerGOD/DSC_C3_W4/run_analysis.R)
####General description

File contains a single function called **"run_analysis"**.

This function is built as a solutuion to "Peer-graded Assignment: Getting and Cleaning Data Course Project" of Week 4 Coursera course "Getting and Cleaning Data".

**Main target**: 

illustrate ability to collect, clean and process data.

**Main target for this function from my perspective is**: 

Fulfill tasks in most readable and transparent way possible, for later usage as a code reference.

Main workflow actions are marked as **##>**. Please follow them to see step-by-step correlation of implementation against actual tasks.

This function was not ever designed to be efficient, **as it was not defined** as a requirement.


####Parameters 

This function is designed to be used without any parameters (as declared in assignment), but **as it was not forbidden** - I added few to makes things simpler.

- **includeActivityLabels**
	 - Default: FALSE.
	 - Optional parameter.
	 - Adds human readable activity labels to a resulting dataset. FALSE by default.
- **rootFolder**
	 - Default: "".
	 - Optional parameter.
	 - A relative path to the required dataset, in case if you wouldn't like to change your working directiry to run this script( like me ). 
	 - **REQUIRES ENCLOSING SLASH**

####Examples
##### simple call, works if you're in the same dir as data (default)
```
result <- run_analysis(); 
```
##### dataset defined in Task + human readable labels for Actions
```
result <- run_analysis(includeActivityLabels = T); 
```
#### directory displacement in action.
```
result <- run_analysis(rootFolder = "RELATIVE/PATH/TO/UCI HAR Dataset/"); 
```

####Outgoing data in general

Please read [**CODEBOOK.md**](https://github.com/ZingerDerGOD/DSC_C3_W4/CODEBOOK.md) for details on data.

## Support

Please [open an issue](https://github.com/ZingerDerGOD/DSC_C3_W4/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/ZingerDerGOD/DSC_C3_W4/compare/).