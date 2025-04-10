import { fireEvent, render, screen, within } from '@testing-library/react';
import '@testing-library/jest-dom';

import Footer from '../components/Footer';
import { footerLinks, socialIcons } from '../components/Footer';

describe('Footer component', () => {
  it('should render Footer component correctly', () => {
    const { container } = render(<Footer />);

    const footer = within(container).getByRole('contentinfo');
    expect(footer).toBeInTheDocument();

    const sections = within(footer).getAllByRole('navigation');
    expect(sections.length).toBe(2);
  });
});

describe('navigation accuracy', () => {
  it('should render all footer links with correct text and href', () => {
    render(<Footer />);
    for (const { href, text } of footerLinks) {
      const link = screen.getByText(text);
      expect(link).toBeInTheDocument();
      expect(link.closest('a')).toHaveAttribute('href', href);
    }
  });
});

describe('navigation accuracy of socialIcons.icon, socialIcons.id', () => {
  it('should render all social media icons correctly', () => {
    render(<Footer />);
    for (const socialIcon of socialIcons) {
      const icon = screen.getByTestId(`${socialIcon.id}`);
      expect(icon).toBeInTheDocument();
    }
  });
});

describe('user interaction with footer links', () => {
  for (const footerLink of footerLinks) {
    it(`should navigate to ${footerLink.href} when ${footerLink.text} is clicked`, () => {
      render(<Footer />);

      const link = screen.getByText(`${footerLink.text}`);
      fireEvent.click(link);
    });
  }
});

describe('user interaction with social media icons', () => {
  for (const socialIcon of socialIcons) {
    it(`should navigate to ${socialIcon.href} when ${socialIcon.id} icon is clicked`, () => {
      render(<Footer />);

      const icon = screen.getByTestId(`${socialIcon.id}`);
      fireEvent.click(icon);
    });
  }
});
