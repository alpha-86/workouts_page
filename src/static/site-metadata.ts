interface ISiteMetadataResult {
  siteTitle: string;
  siteUrl: string;
  description: string;
  keywords: string;
  logo: string;
  navLinks: {
    name: string;
    url: string;
  }[];
}

const data: ISiteMetadataResult = {
  siteTitle: 'Alpha's Workouts Map',
  siteUrl: 'https://running.cqcy.host',
  logo: 'https://avatars.githubusercontent.com/u/4555697?s=460&u=97e1062227c4088db3c987146455245c6fa78441',
  description: 'Personal site and blog',
  keywords: 'workouts, running, ski, cycling, riding, roadtrip, hiking, swimming',
  navLinks: [
    {
      name: 'GitHub',
      url: 'https://github.com/alpha-86',
    },
    {
      name: 'About',
      url: 'https://github.com/alpha-86',
    },
  ],
};

export default data;
