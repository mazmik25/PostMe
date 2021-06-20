
# PostMe

Learning Resource for the Presentation held in Apple Academy UC


## Take The Source Code

Clone the project

```bash
  git clone https://github.com/mazmik25/PostMe.git
```

Make sure you're using the latest Xcode (mine was Xcode 12.5)
## Challenge
**Modularized VIPERed Profile** \
You're almost there! After working with viperized the Profile page, we can now start 
to move it to our new modul, let's say Profile because it's Profile feature, right?
Go ahead by clicking `File` -> `New` -> `Target` -> Select `Framework`. After creating the target, move your vipered Profile page to the target. Don't forget to change the Target Membership. Hit cmd + opt + 0 and select Show File Inspector. Tick on every files that you've moved to the target (i name my module as Profile) \

<img width="260" alt="Screen Shot 2021-06-20 at 13 43 28" src="https://user-images.githubusercontent.com/25825451/122665195-0ad3fd80-d1d0-11eb-948c-15098dc3a235.png">

**Moving the VIPERed Profile to Profile Module** \
After creating the target, you can move our VIPERed files into the new `Profile` module that we created recently. After that hit `cmd + R` to see the impact. It's that simple, right? Or...is it? \
It looks like Xcode doesn't happy with our changes. Can you please put the smile back to Xcode? I'm counting on you! I know you can! Good luck! \
**Hint:** You also need to modularized these files:
- ApiError (create new file)
- BaseWireframe
- PresenterInterface
- ViewInterface
- InteractorInterface
