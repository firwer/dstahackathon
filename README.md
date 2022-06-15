# DSTA 2022 Brainhack - CodeEXP
## Team: cap5pls (cat1 grp 22)

Problem Statement: How can we leverage digital technologies to enable greater convenience and flexibility for our NS men in the workspaces in which they live, work and play?

Description of our APP: Our application, MyArmyPal serves to be an all in one service for our service men. It seeks to provide convenience and useful features just one tap away. Its main features include an IPPT Calculator, reservist checklist, customized IPPT training plan according to the user's current fitness level and a canteen order pick up service in all army camps. We are also implementing an anytime Eliss system using computer vision for users to check on their push up form easily.


**Features:**
1. Firebase Auth (User State and identity management
2. IPPT Fitness Score Calculator (Age and Gender)
3. FITPlan System (Automatic Integrated Fitness Curiculum Planning System)
4. eCanteen Pickup Service (Easy Army Canteen Order Pickup Management System)
5. Reservist Packing Buddy (Reservist Packing List Helper for NSMAN)
7. Anytime ELISS System (Work In Progress) (Not implemented but model ready, see below)

**Project Contributors:**
- Poh Wei Pin (@firwer) (App Auth and Data Collection,Home & Signup Pages, ML Model)
- Tan Zi Xi (@tzixi) IPPT Fitness Score Calculator, FITPlan and UI designer)
- Wang Yong Bin (@YongbinWang) (eCanteen Pickup, FITPlan and UI designer, Presenter)
- Wong Qin Yao (Sean) (@ExtraShotLatte) (Reservist Packing Buddy, NS Refresher, SlideDeck and Video Editor for presentation)

App Video Introduction: https://youtu.be/e7hrOdYwr0E
![image](https://user-images.githubusercontent.com/7589432/173734771-13319e21-054a-41ae-b08f-5b8196ff4929.png)

APK Release: 

**Tech Stack Used: Flutter + Firebase/Firestore**

Anytime Eliss (Trained Model)

![image](https://user-images.githubusercontent.com/7589432/173735679-017f341e-3dcd-4ee7-9f9d-6faebd2a46d9.png)

**This was not implemented due to difficulties in implementing ML model interpreter**

![image](https://user-images.githubusercontent.com/7589432/173735702-ab9b5188-a1af-423b-bd74-243e43bc87f7.png)

AAR: Problem Face - Camera & Model was working well, but there was no detection on screen despite repeated test and changing of different intepreter plugins

- Implementation is in ML Branch, it is not merged to main
