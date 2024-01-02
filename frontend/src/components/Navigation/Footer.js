import { useLocation } from 'react-router-dom';

const Footer = () => {


    const location = useLocation();

    const currentPathway = location.pathname;

    let footer;

    const segments = currentPathway.split('/');
    const id = segments[segments.length - 1];


    if (id) {
        footer = 'showFooter'
    } else {
        footer = 'indexFooter'
    }

    return (
        <div id={footer}>
        <div>© 2023 Airdnd, Inc.TermsSitemapPrivacyYour Privacy Choices </div>
        <div className="social-media-list-footer">
        <ul className="social-media-list">
            <li>
                <a href="https://www.linkedin.com/in/avery-berry-6a562a253/" target="_blank">
                    <i id='socials-buttons' className="fab fa-linkedin"></i> 
                </a>
            </li>
            <li>
                <a href="https://github.com/AveryRBerry" target="_blank">
                    <i id='socials-buttons' className="fab fa-github"></i>
                </a>
            </li>
            <li>
                <a href="https://averyrberry.github.io/Portfolio/" target="_blank">
                    <i id='socials-buttons' className="fab fa-product-hunt"></i>
                </a>
            </li>
        </ul>
        English (US) Currency $USD</div>
        </div>
    )
}

export default Footer;