
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
**Learn VIPER** \
Since implementing `VIPER` can make your hand swollen, you can use [this](https://github.com/infinum/iOS-VIPER-Xcode-Templates/tree/feature/v4.0) 
great generator to ease that pain. After installing the generator, we can continue to the next step. 

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
With that being said, can you help me to refactor my Profile page into VIPER?

## Definition of Done
It's done when you finally viperized the Profile module (List and Detail) and the app works as before \
https://user-images.githubusercontent.com/25825451/122664353-1113ab00-d1cb-11eb-8163-2974a73e653a.mov
