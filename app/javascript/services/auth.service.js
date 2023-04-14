import { authHeader, handleResponse } from '../helpers';

export const authService = {
  login,
  signup,
  logout,
};

function login(email, password) {
  const requestOptions = {
    method: 'POST',
    headers: { ...authHeader(), 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password })
  };

  return fetch('/api/v1/login', requestOptions)
    .then(handleResponse)
    .then(data => {
      const { user, auth_token } = data;
      localStorage.setItem('user', JSON.stringify(user));
      localStorage.setItem('token', JSON.stringify(auth_token));

      return user;
    });
}

function signup(user) {
  const requestOptions = {
    method: 'POST',
    headers: { ...authHeader(), 'Content-Type': 'application/json' },
    body: JSON.stringify(user)
  };

  console.log('requestOptions', requestOptions)

  return fetch('/api/v1/signup', requestOptions)
    .then(handleResponse)
    .then(user => {
      // store user details and jwt token in local storage to keep user logged in between page refreshes
      localStorage.setItem('user', JSON.stringify(user));

      return user;
    });
}

async function logout() {
  localStorage.removeItem('user');
  localStorage.removeItem('token');
}
