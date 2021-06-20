
# PostMe

Learning Resource for the Presentation held in Apple Academy UC


## Take The Source Code

Clone the project

```bash
  git clone https://github.com/mazmik25/PostMe.git
```

Make sure you're using the latest Xcode (mine was Xcode 12.5). Don't forget to 
rename the `bundle ID` since we'll implement Firebase too!

## Challenge
**Validate your implementation with Unit Testing** \
If you're in this milestone, i would like to congratulate you! Because you're on the final step! \
Now, how do we know if our methods run as expected without running the app? **Exactly!** By creating unit test cases, we can immediately know wether our codes run
as we want or not. Now, without furthermore, i would like you to create unit test cases for my Profile module. Can you do it?

After modularizing the `Profile`, first thing to do is to configure the coverage percentage so that we can see how much our test cases cover the codes. You can configure it by clicking the target and select `Edit Scheme`.  After that go to Options tab and add your framework followed with the unit test framework too. It should be like this

<img width="1792" alt="Screen Shot 2021-06-20 at 16 08 47" src="https://user-images.githubusercontent.com/25825451/122668538-c30aa180-d1e2-11eb-8441-4da3b5a6a6bc.png">

## Definition of Done
When you finish writing all the test cases, you can hit `cmd + U`. Don't worry, you don't have to achieve 100% coverage. After it finishes, you can navigate to `Show the Report Navigator` and select the latest `Coverage`. Don't forget to tick `Show Test Bundles`. It should be like this
<img width="1792" alt="Screen Shot 2021-06-20 at 16 08 41" src="https://user-images.githubusercontent.com/25825451/122668602-12e96880-d1e3-11eb-8de1-7165ed698a00.png">


