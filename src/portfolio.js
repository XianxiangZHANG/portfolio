/* Change this file to get your personal Portfolio */

// To change portfolio colors globally go to the  _globalColor.scss file

import emoji from "react-easy-emoji";
import splashAnimation from "./assets/lottie/splashAnimation"; // Rename to your file name for custom animation

// Splash Screen

const splashScreen = {
  enabled: true, // set false to disable splash screen
  animation: splashAnimation,
  duration: 2000 // Set animation duration as per your animation
};

// Summary And Greeting Section

const illustration = {
  animated: true // Set to false to use static SVG
};

const greeting = {
  username: "Xianxiang Zhang",
  title: "Hi all, I'm Xianxiang",
  subTitle: emoji(
    "A passionate data/software engineer 🚀 with experience using Python, C, C++, C# and other programming languages and frameworks like Django, Angular, etc. And worked as an ABAPer for 1 year in INOSSEM(France)."
  ),
  resumeLink:
    "https://drive.google.com/file/d/1fhURw-JGravOlrXTR2Ow_L5dZ8pTLWYI/view?usp=sharing", // Set to empty to hide the button
  displayGreeting: true // Set false to hide this section, defaults to true
};

// Social Media Links

const socialMediaLinks = {
  github: "https://github.com/XianxiangZHANG",
  linkedin: "https://www.linkedin.com/in/xianxiang-zhang-680502253/",
  gmail: "zhangxianxiang99@gmail.com",
  // Instagram, Twitter and Kaggle are also supported in the links!
  // To customize icons and social links, tweak src/components/SocialMedia
  display: true // Set true to display this section, defaults to false
};

// Skills Section

const skillsSection = {
  title: "What I do",
  subTitle: "A DEVELOPER EXPLORING THE FIELD OF COMPUTER SCIENCE.",
  skills: [
    emoji("⚡ Develop highly interactive Front end / User Interfaces for your web and mobile applications"),
    emoji("⚡ Design and develop a suitable database structure"),
    emoji("⚡ Integration of third party services such as Google Cloud Platform"),
    emoji("⚡ Develop custom features in SAP using ABAP"),
    emoji("⚡ Work on SAP system migration and data handling"),
    emoji("⚡ Perform testing and debugging in SAP projects")
  ],
  /* Make Sure to include correct Font Awesome Classname to view your icon
https://fontawesome.com/icons?d=gallery */

  softwareSkills: [
    {
      skillName: "html-5",
      fontAwesomeClassname: "fab fa-html5"
    },
    {
      skillName: "css3",
      fontAwesomeClassname: "fab fa-css3-alt"
    },
    {
      skillName: "JavaScript",
      fontAwesomeClassname: "fab fa-js"
    },
    {
      skillName: "Angular",
      fontAwesomeClassname: "fab fa-angular"
    },
    {
      skillName: "sql-database",
      fontAwesomeClassname: "fas fa-database"
    },
    {
      skillName: "GCP",
      fontAwesomeClassname: "fab fa-google"
    },
    {
      skillName: "python",
      fontAwesomeClassname: "fab fa-python"
    },
    {
      skillName: "microsoft office",
      fontAwesomeClassname: "fab fa-microsoft"
    },
    {
      skillName: "SAP",
      fontAwesomeClassname: "fab fa-database"
    },
    {
      skillName: "PGO+",
      fontAwesomeClassname: "fab fa-microchip"
    }
  ],
  display: true // Set false to hide this section, defaults to true
};


// Your top 3 proficient stacks/tech experience

const techStack = {
  viewSkillBars: false, //Set it to true to show Proficiency Section
  experience: [
    {
      Stack: "Frontend/Design", //Insert stack or technology you have experience in
      progressPercentage: "90%" //Insert relative proficiency in percentage
    },
    {
      Stack: "Programming",
      progressPercentage: "70%"
    },
    {
      Stack: "Backend",
      progressPercentage: "60%"
    }
  ],
  displayCodersrank: false // Set true to display codersrank badges section need to changes your username in src/containers/skillProgress/skillProgress.js:17:62, defaults to false
};

// Work experience section
const workExperiences = {
  display: true, //Set it to true to show workExperiences Section
  experience: [
    {
      role: "Developer",
      company: "INOSSEM",
      companylogo: require("./assets/images/logo_inossem.jpg"),
      date: "October 2024 – Now",
      desc: "SAP ABAP developer involved in custom development, system migration, and project testing at Inossem.",
      descBullets: [
        "Develop custom features in SAP using ABAP",
        "Work on SAP system migration and data handling",
        "Perform testing and debugging in SAP projects",
        "Monitor and upgrade PGO+ processes",
      ]
    },
    {
      role: "Software Engineer(Intern)",
      company: "Gradel Light Weight",
      companylogo: require("./assets/images/logo_gradel.png"),
      date: "April 2024 – September 2024",
      desc: "I interned at Gradel LW for six months and independently created a usable database system for the company using Django.",
      descBullets: [
        "Designed the database structure.",
        "Created the website based on the database by Django and Bootstrap.",
        "Familiar with basic robot operation.",
        "Functioned as a full-stack developer, independently managing and completing the entire project.",
      ]
    },
    {
      role: "Unit Tester(Intern)",
      company: "LS2N",
      companylogo: require("./assets/images/logo_ls2n.png"),
      date: "May 2023 – September 2023",
      desc: "I interned at LS2N for four months, contributing to a Bayesian network project by enhancing testing infrastructure and development workflows.",
      descBullets: [
        "Created the Gitlab Wiki Documentation.",
        "Created new functions to deal with the images.",
        "Contributed extensively to the unit test code.",
        "Perfected the CI/CD setup.",
        "Implemented Gitlab Pages configuration to display code coverage and documentation.",
      ]
    },
    
  ]
};


// Education Section

const educationInfo = {
  display: true, // Set false to hide this section, defaults to true
  schools: [
    {
      schoolName: "Polytech Nantes",
      logo: require("./assets/images/logo_polytech.jpeg"),
      subHeader: "Computer Science Engineer Degree",
      duration: "September 2022 - September 2024",
      desc: "Took courses about Machine Learning, Database, etc.Participated in multiple projects and two internships",
      
    },
    {
      schoolName: "Ocean University of China",
      logo: require("./assets/images/logo_ouc.png"),
      subHeader: "Bachelor of Science in Computer Science",
      duration: "September 2018 - July 2022",
      desc: "Took courses about Software Engineering, Web Security, Operating Systems, ...",
    }
  ]
};


/* Your Open Source Section to View Your Github Pinned Projects
To know how to get github key look at readme.md */

const openSource = {
  showGithubProfile: "true", // Set true or false to show Contact profile using Github, defaults to true
  display: false // Set false to hide this section, defaults to true
};

// Some big projects you have worked on

const bigProjects = {
  title: "Projects",
  subtitle: "SOME PROJECTS I EXPERIRNCED",
  projects: [
    {
      
      projectName: "Leibniz Manuscript Detection and Segmentation",
      projectDesc: "Our project aims to detect and segment mathematical expressions in Leibniz's manuscripts. We generated 300 artificial images through data augmentation to expand the dataset and used a deep convolutional neural network to train the model.",
      footerLink: [
        {
          name: "Source code",
          url: "https://github.com/XianxiangZHANG/Leibniz-Manuscript-Detection-Segmentation"
        }
        //  you can add extra buttons here.
      ]
    },
    {
      
      projectName: "The digital logbook for DIVANUM",
      projectDesc: "Our project aims to design a health data recording website for the elderly. This will make it easier for the elderly to record their own health information and for health institutions to query user information.",
      footerLink: [
        {
          name: "Source code",
          url: "https://github.com/XianxiangZHANG/divanum"
        }
      ]
    },
    {
      
      projectName: "Environmental protection publicity website",
      projectDesc: "The project aims to promote environmental protection through a website, with a special focus on the carbon cycle.",
      footerLink: [
        {
          name: "Source code",
          url: "https://github.com/XianxiangZHANG/Hyblab2023/tree/main/carbone"
        }
        //  you can add extra buttons here.
      ]
    },
  ],
  display: true // Set false to hide this section, defaults to true
};

// Achievement Section
// Include certificates, talks etc

const achievementSection = {
  title: emoji("Achievements And Certifications 🏆 "),
  subtitle:
    "Achievements, Certifications, Award Letters and Some Cool Stuff that I have done !",

  achievementsCards: [
    {
      title: "Google Code-In Finalist",
      subtitle:
        "First Pakistani to be selected as Google Code-in Finalist from 4000 students from 77 different countries.",
      image: require("./assets/images/codeInLogo.webp"),
      imageAlt: "Google Code-In Logo",
      footerLink: [
        {
          name: "Certification",
          url: "https://drive.google.com/file/d/0B7kazrtMwm5dYkVvNjdNWjNybWJrbndFSHpNY2NFV1p4YmU0/view?usp=sharing"
        },
        {
          name: "Award Letter",
          url: "https://drive.google.com/file/d/0B7kazrtMwm5dekxBTW5hQkg2WXUyR3QzQmR0VERiLXlGRVdF/view?usp=sharing"
        },
        {
          name: "Google Code-in Blog",
          url: "https://opensource.googleblog.com/2019/01/google-code-in-2018-winners.html"
        }
      ]
    },
    {
      title: "Google Assistant Action",
      subtitle:
        "Developed a Google Assistant Action JavaScript Guru that is available on 2 Billion devices world wide.",
      image: require("./assets/images/googleAssistantLogo.webp"),
      imageAlt: "Google Assistant Action Logo",
      footerLink: [
        {
          name: "View Google Assistant Action",
          url: "https://assistant.google.com/services/a/uid/000000100ee688ee?hl=en"
        }
      ]
    },

    {
      title: "PWA Web App Developer",
      subtitle: "Completed Certifcation from SMIT for PWA Web App Development",
      image: require("./assets/images/pwaLogo.webp"),
      imageAlt: "PWA Logo",
      footerLink: [
        { name: "Certification", url: "" },
        {
          name: "Final Project",
          url: "https://pakistan-olx-1.firebaseapp.com/"
        }
      ]
    }
  ],
  display: false // Set false to hide this section, defaults to true
};

// Blogs Section

const blogSection = {
  title: "Blogs",
  subtitle:
    "With Love for Developing cool stuff, I love to write and teach others what I have learnt.",
  displayMediumBlogs: "true", // Set true to display fetched medium blogs instead of hardcoded ones
  blogs: [
    {
      url: "https://blog.usejournal.com/create-a-google-assistant-action-and-win-a-google-t-shirt-and-cloud-credits-4a8d86d76eae",
      title: "Win a Google Assistant Tshirt and $200 in Google Cloud Credits",
      description:
        "Do you want to win $200 and Google Assistant Tshirt by creating a Google Assistant Action in less then 30 min?"
    },
    {
      url: "https://medium.com/@saadpasta/why-react-is-the-best-5a97563f423e",
      title: "Why REACT is The Best?",
      description:
        "React is a JavaScript library for building User Interface. It is maintained by Facebook and a community of individual developers and companies."
    }
  ],
  display: false // Set false to hide this section, defaults to true
};

// Talks Sections

const talkSection = {
  title: "TALKS",
  subtitle: emoji(
    "I LOVE TO SHARE MY LIMITED KNOWLEDGE AND GET A SPEAKER BADGE 😅"
  ),

  talks: [
    {
      title: "Build Actions For Google Assistant",
      subtitle: "Codelab at GDG DevFest Karachi 2019",
      slides_url: "https://bit.ly/saadpasta-slides",
      event_url: "https://www.facebook.com/events/2339906106275053/"
    }
  ],
  display: false // Set false to hide this section, defaults to true
};

// Podcast Section

const podcastSection = {
  title: emoji("Podcast 🎙️"),
  subtitle: "I LOVE TO TALK ABOUT MYSELF AND TECHNOLOGY",

  // Please Provide with Your Podcast embeded Link
  podcast: [
    "https://anchor.fm/codevcast/embed/episodes/DevStory---Saad-Pasta-from-Karachi--Pakistan-e9givv/a-a15itvo"
  ],
  display: false // Set false to hide this section, defaults to true
};

// Resume Section
const resumeSection = {
  title: "Resume",
  subtitle: "Feel free to download my resume",

  // Please Provide with Your Podcast embeded Link
  display: false // Set false to hide this section, defaults to true
};

const contactInfo = {
  title: emoji("Contact Me ☎️"),
  subtitle:
    "Discuss a job or just want to say hi? My Inbox is open for all.",
  number: "+33-0624031557",
  email_address: "zhangxianxiang99@gmail.com"
};

// Twitter Section

const twitterDetails = {
  userName: "twitter", //Replace "twitter" with your twitter username without @
  display: false // Set true to display this section, defaults to false
};

const isHireable = true; // Set false if you are not looking for a job. Also isHireable will be display as Open for opportunities: Yes/No in the GitHub footer

export {
  illustration,
  greeting,
  socialMediaLinks,
  splashScreen,
  skillsSection,
  workExperiences,
  educationInfo,
  techStack,
  openSource,
  bigProjects,
  achievementSection,
  blogSection,
  talkSection,
  podcastSection,
  contactInfo,
  twitterDetails,
  isHireable,
  resumeSection
};
