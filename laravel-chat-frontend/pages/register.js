'use client';

import { useState, useEffect } from 'react';
import axios from 'axios';
import { useRouter } from 'next/router';
import 'bootstrap/dist/css/bootstrap.min.css';
import Link from 'next/link';
import { isAuthenticated } from '../utils/auth'; 

export default function Register() {
  const router = useRouter();
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [isAuth, setIsAuth] = useState(false);

  useEffect(() => {
    setIsAuth(isAuthenticated());
  }, []);

  async function handleSubmit(e) {
    e.preventDefault();
    setError('');

    if (password !== passwordConfirm) {
      setError('Passwords do not match');
      return;
    }

    try {
      setLoading(true);
      await axios.post('http://localhost:8000/api/register', {
        name,
        email,
        password,
        password_confirmation: passwordConfirm,
      });
      router.push('/login');
    } catch (err) {
      setError('Failed to register');
    } finally {
      setLoading(false);
    }
  }

  if (isAuth) {
    return (
      <div className="min-vh-100 d-flex align-items-center justify-content-center text-white" style={styles.bg}>
        <div className="position-absolute w-100 h-100" style={{ zIndex: 0 }}>
          <div style={{ ...styles.blob, ...styles.blob1 }}></div>
          <div style={{ ...styles.blob, ...styles.blob2 }}></div>
        </div>
        <div className="card p-4 rounded-4 shadow-lg text-center" style={{ width: '100%', maxWidth: 400, zIndex: 10, backgroundColor: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)' }}>
          <h3 className="mb-3">Access Denied</h3>
          <p>You are already logged in. The registration page is disabled.</p>
          <a href="/dashboard" className="btn btn-primary rounded-pill px-4">
            Go to Dashboard
          </a>
        </div>
      </div>
    );
  }

  return (
    <div className="min-vh-100 d-flex align-items-center justify-content-center text-white" style={styles.bg}>
      <div className="position-absolute w-100 h-100" style={{ zIndex: 0 }}>
        <div style={{ ...styles.blob, ...styles.blob1 }}></div>
        <div style={{ ...styles.blob, ...styles.blob2 }}></div>
      </div>

      <div className="card p-4 rounded-4 shadow-lg" style={{ width: '100%', maxWidth: 400, zIndex: 10, backgroundColor: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)' }}>
        <h3 className="mb-3 text-center">Register</h3>

        {error && <div className="alert alert-danger py-2">{error}</div>}

        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <input
              type="text"
              className="form-control rounded-pill px-4 py-3"
              style={styles.input}
              placeholder="Name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <input
              type="email"
              className="form-control rounded-pill px-4 py-3"
              style={styles.input}
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <input
              type="password"
              className="form-control rounded-pill px-4 py-3"
              style={styles.input}
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <input
              type="password"
              className="form-control rounded-pill px-4 py-3"
              style={styles.input}
              placeholder="Confirm Password"
              value={passwordConfirm}
              onChange={(e) => setPasswordConfirm(e.target.value)}
              required
            />
          </div>

          <button type="submit" className="btn btn-primary w-100 rounded-pill py-2" disabled={loading}>
            {loading ? 'Registering...' : 'Register'}
          </button>
        </form>

        <p className="text-center mt-3">
          Already have an account?{' '}
          <Link href="/login" className="text-info text-decoration-underline">
            Login
          </Link>
        </p>
      </div>
    </div>
  );
}

// In-file CSS styles
const styles = {
  bg: {
    background: 'linear-gradient(135deg, #5b21b6, #1e3a8a, #4f46e5)',
    position: 'relative',
    overflow: 'hidden'
  },
  input: {
    background: 'rgba(255, 255, 255, 0.05)',
    border: '1px solid rgba(255, 255, 255, 0.2)',
    color: '#fff',
    backdropFilter: 'blur(10px)',
    borderRadius: '50px',
    fontSize: '1rem',
    outline: 'none',
    boxShadow: 'inset 0 0 0 999px transparent'
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
    left: '50px',
    width: '300px',
    height: '300px',
    backgroundColor: '#a855f7'
  },
  blob2: {
    bottom: '-100px',
    right: '60px',
    width: '300px',
    height: '300px',
    backgroundColor: '#06b6d4'
  }
};