'use client';
import { useEffect, useState } from 'react';
import { isAuthenticated } from '../utils/auth'; 
import {
  MessageCircle,
  Users,
  Zap,
  Shield,
  ArrowRight,
  Sparkles
} from 'lucide-react';
import 'bootstrap/dist/css/bootstrap.min.css';

const HomePage = () => {
  const [isAuth, setIsAuth] = useState(false);

  useEffect(() => {
    setIsAuth(isAuthenticated());
  }, []);

  if (isAuth) {
    return (
      <div className="min-vh-100 d-flex align-items-center justify-content-center text-white" style={styles.gradientBackground}>
        <div className="text-center p-4 rounded bg-opacity-10 bg-white border text-white">
          <h3 className="mb-3">Access Denied</h3>
          <p>You are already logged in. These pages are not accessible.</p>
          <a href="/dashboard" className="btn btn-primary rounded-pill px-4">
            Go to Dashboard
          </a>
        </div>
      </div>
    );
  }

  return (
    <div className="position-relative min-vh-100 text-white overflow-hidden" style={styles.gradientBackground}>
      {/* Background Blobs */}
      <div className="position-absolute top-0 start-0 w-100 h-100 z-n1">
        <div style={{ ...styles.blob, ...styles.blob1 }} />
        <div style={{ ...styles.blob, ...styles.blob2 }} />
        <div style={{ ...styles.blob, ...styles.blob3 }} />
      </div>

      {/* Navbar */}
      <nav className="d-flex justify-content-between align-items-center p-4">
        <div className="d-flex align-items-center gap-2">
          <div style={styles.iconBox}>
            <MessageCircle color="white" size={24} />
          </div>
          <h4 className="mb-0 fw-bold">ChatFlow</h4>
        </div>
        <div className="d-flex gap-3">
          <a href="/login" className="btn btn-link text-white">Login</a>
          <a href="/register" className="btn btn-primary rounded-pill px-4">Get Started</a>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="container text-center py-5">
        <div className="mb-4 d-inline-block px-3 py-2 border border-info rounded-pill bg-opacity-10 bg-info text-info">
          <Sparkles size={16} className="me-2" />
          The Future of Communication
        </div>

        <h1 className="display-4 fw-bold">
          Connect Beyond <br />
          <span style={styles.gradientText}>Boundaries</span>
        </h1>

        <p className="lead text-light mt-3 mb-4">
          Experience seamless conversations with lightning-fast messaging, voice, and AI features.
        </p>

        <div className="d-flex flex-column flex-sm-row justify-content-center gap-3">
          <a href="/register" className="btn btn-lg btn-primary rounded-pill d-flex align-items-center gap-2">
            Start Chatting Now <ArrowRight size={18} />
          </a>
          <a href="/login" className="btn btn-outline-light btn-lg rounded-pill">
            Sign In
          </a>
        </div>
      </section>

      {/* Features */}
      <section className="container my-5">
        <div className="row g-4">
          {[
            {
              Icon: Zap,
              title: "Lightning Fast",
              desc: "Messages delivered instantly with zero delays or interruptions.",
              color: "#0d6efd"
            },
            {
              Icon: Users,
              title: "Team Collaboration",
              desc: "Create groups, share files, and work together effortlessly.",
              color: "#d63384"
            },
            {
              Icon: Shield,
              title: "Ultra Secure",
              desc: "Military-grade encryption to keep your conversations private.",
              color: "#198754"
            }
          ].map(({ Icon, title, desc, color }, i) => (
            <div className="col-md-4" key={i}>
              <div className="p-4 rounded bg-opacity-10 bg-white border text-white h-100">
                <div className="p-3 rounded mb-3 d-inline-block" style={{ backgroundColor: color }}>
                  <Icon size={24} color="white" />
                </div>
                <h5>{title}</h5>
                <p>{desc}</p>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Call to Action */}
      <section className="container text-center my-5">
        <div className="p-5 bg-opacity-10 bg-info rounded-4 border border-info text-white">
          <h3>Ready to Transform Your Communication?</h3>
          <p className="mb-4">Join thousands already using ChatFlow today.</p>
          <div className="d-flex flex-column flex-sm-row justify-content-center gap-3">
            <a href="/register" className="btn btn-primary btn-lg rounded-pill">Create Free Account</a>
            <a href="/login" className="btn btn-link text-info">Already have an account? Sign in →</a>
          </div>
        </div>
      </section>
    </div>
  );
};

export default HomePage;

// In-file CSS (JS object)
const styles = {
  gradientBackground: {
    background: 'linear-gradient(135deg, #5b21b6, #1e3a8a, #4f46e5)',
  },
  gradientText: {
    background: 'linear-gradient(to right, #06b6d4, #9333ea)',
    WebkitBackgroundClip: 'text',
    WebkitTextFillColor: 'transparent',
    display: 'inline-block'
  },
  iconBox: {
    background: 'linear-gradient(to right, #06b6d4, #9333ea)',
    padding: '8px',
    borderRadius: '12px'
  },
  blob: {
    position: 'absolute',
    borderRadius: '50%',
    filter: 'blur(80px)',
    opacity: 0.2,
    animation: 'pulse 6s infinite'
  },
  blob1: {
    top: '80px',
    left: '40px',
    width: '300px',
    height: '300px',
    backgroundColor: '#a855f7'
  },
  blob2: {
    top: '160px',
    right: '40px',
    width: '300px',
    height: '300px',
    backgroundColor: '#06b6d4',
    animationDelay: '2s'
  },
  blob3: {
    bottom: '-120px',
    left: '50%',
    transform: 'translateX(-50%)',
    width: '300px',
    height: '300px',
    backgroundColor: '#ec4899',
    animationDelay: '4s'
  }
};