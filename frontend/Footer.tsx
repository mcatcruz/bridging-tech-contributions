/* eslint-disable react-refresh/only-export-components */

import React from 'react';

import { ReactComponent as FacebookIcon } from '../assets/facebook--negative.svg';
import { ReactComponent as TwitterIcon } from '../assets/twitter--negative.svg';
import { ReactComponent as InstagramIcon } from '../assets/instagram--negative.svg';
import { ReactComponent as LinkedInIcon } from '../assets/linkedin--negative.svg';
import { ReactComponent as EmailIcon } from '../assets/mail-outline.svg';

interface FooterLink {
  href: string;
  text: string;
}

interface SocialIcon {
  href: string;
  icon: JSX.Element;
  id: string;
}

export const footerLinks: FooterLink[] = [
  { href: '#', text: 'Home' },
  { href: '#', text: 'Profile' },
  { href: '#', text: 'Contact Us' },
  { href: '#', text: 'Donate' },
  { href: '#', text: 'Volunteer' },
  { href: '#', text: 'Privacy Policy' },
];

export const socialIcons: SocialIcon[] = [
  { href: '#', icon: <FacebookIcon />, id: 'facebook' },
  { href: '#', icon: <TwitterIcon />, id: 'twitter' },
  { href: '#', icon: <InstagramIcon />, id: 'instagram' },
  { href: '#', icon: <LinkedInIcon />, id: 'linkedin' },
  { href: '#', icon: <EmailIcon />, id: 'email' },
];
const Footer: React.FC = () => {
  return (
    <footer role='contentinfo' className='max-w-screen-sm m-auto flex-col'>
      <div
        role='navigation'
        className='py-footerRows flex flex-wrap flex-row justify-center'
      >
        <div className='flex flex-row flex-nowrap justify-center'>
          {footerLinks.slice(0, 4).map((link, i) => (
            <p
              key={i}
              className='px-footerIcons font-kollektif text-sm text-black min-w-max'
            >
              <a href={link.href}>{link.text}</a>
            </p>
          ))}
        </div>
        <div className='flex flex-row justify-center'>
          {footerLinks.slice(4).map((link, i) => (
            <p
              key={i + 4}
              className='px-footerIcons font-kollektif text-sm text-black'
            >
              <a href={link.href}>{link.text}</a>
            </p>
          ))}
        </div>
      </div>

      <div
        role='navigation'
        className='py-footerRows flex flex-row flex-nowrap items-center justify-center'
      >
        {socialIcons.map((icon, i) => {
          return (
            <a
              key={i}
              href={icon.href}
              data-testid={`${icon.id}`}
              className='px-footerIcons'
            >
              {icon.icon}
            </a>
          );
        })}
      </div>
    </footer>
  );
};

export default Footer;
