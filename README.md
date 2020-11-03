# kernel-regression-test-and-upload
Automated script to run Fedora Kernel Regression Testing and upload its results automatically.

### Features
- Authentication done before testing is done
- One file to run all the steps
- [Original Link for Kernel Regression Testing](https://fedoraproject.org/wiki/QA:Testcase_kernel_regression)

### Steps to run:
1. Clone this repository
2. Go inside the directory
`cd kernel-regression-test-and-upload/`
3. Make files executable and run
`chmod +x *`
`./kernel.sh`
If you want to create a log file,
`./kernel.sh > logfile`
4. Enter your FAS credentials
5. It will run and upload the results.
