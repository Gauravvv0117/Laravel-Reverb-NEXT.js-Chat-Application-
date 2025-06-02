export const isAuthenticated = () => {
  const token = localStorage.getItem('token'); // Adjust the key based on your setup
  return !!token; // Returns true if token exists, false otherwise
};