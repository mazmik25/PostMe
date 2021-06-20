
# PostMe

Learning Resource for the Presentation held in Apple Academy UC


## Take The Source Code

Clone the project

```bash
  git clone https://github.com/mazmik25/PostMe.git
```

Make sure you're using the latest Xcode (mine was Xcode 12.5)

## Challenge
- Implementing **SwiftLint** \
In the first step, you will learn how to implement swiftlint into your project. You can check the configuration [here](https://github.com/realm/SwiftLint).
For the solution, you can check it [here](https://github.com/mazmik25/PostMe/tree/enhancement/add_swiftlint)

- Learn **VIPER** \
Since implementing `VIPER` can make your hand swollen, you can use [this](https://github.com/infinum/iOS-VIPER-Xcode-Templates/tree/feature/v4.0) 
great generator to ease that pain. After installing the generator, we can continue 
to the next step. \
\
**Create VIPER Files For Profile** \
Just hit `cmd + N` to create a new file and scroll it until you find the generator icon
(it looks like a snake). Name the module as `Profile` and you're finished with the first 
step. \
\
**Refactor Existing Profile Into VIPER** \
As you see in the project, i implement the `MVC` to finish my project. But you have a 
chance to help me refactoring the code into `VIPER`. Now, remember that `VIPER` stands
for `View`, `Interactor`, `Presenter`, `Entity`, and `Router`. I won't describe the 
details here, because those can be read 
[here](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6)
and [here](https://www.raywenderlich.com/8440907-getting-started-with-the-viper-architecture-pattern).
With that being said, can you help me to refactor my Profile page into VIPER? \
After about an hour, a day or two, if you feel stuck with this challenge -- 
not with the old memories...;) -- feel free to check the solution 
[here](https://github.com/mazmik25/PostMe/tree/enhancement/viper_profile_module).

- Modularized VIPERed Profile \
You're almost there! After working with viperized the Profile page, we can now start 
to move it to our new modul, let's say Profile because it's Profile feature, right?
Go ahead by clicking `File` -> `New` -> `Target` -> Select `Framework`. \
\
**Moving the VIPERed Profile to Profile Module** \
After creating the target, you can move our VIPERed files into the new `Profile` module 
that we created recently. After that hit `cmd + R` to see the impact. It's that simple, 
right? Or...is it? \
It looks like Xcode doesn't happy with our changes. Can you please put the smile back 
to Xcode? I'm counting on you! I know you can! Good luck! \
Finished yet? Or are you just looking for solution? Fine! Here's [my implementation](https://github.com/mazmik25/PostMe/tree/enhancement/modularized_viper_profile)

- Validate your implementation with Unit Testing \
If you're in this milestone, i would like to congratulate you! Because you're on the 
final step! \
Now, how do we know if our methods run as expected without running the app? **Exactly!** By creating unit test cases, we can immediately know wether our codes run
as we want or not. Now, without furthermore, i would like you to create unit test cases 
for my Profile module. Can you do it? \
Don't worry, if you feel tired already, you can check my implementation right [here](https://github.com/mazmik25/PostMe/tree/enhancement/unit_test_profile)
