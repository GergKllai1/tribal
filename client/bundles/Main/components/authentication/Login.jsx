import React, { Component } from "react";
import ReactOnRails from "react-on-rails";
import LoginForm from "./LoginForm";

const axios = require("axios");

export class Login extends Component {
	constructor(props) {
		super(props);
		this.state = {
			email: "",
			password: "",
			formErrors: "",
			sessionId: ""
		};
		this.onChange = this.onChange.bind(this);
		this.onSubmit = this.onSubmit.bind(this);
		this.fbLogin = this.fbLogin.bind(this);
	}

	componentDidMount() {
		let session = document.location.hash.slice(1);
		if (session) {
			this.setState({
				sessionId: session
			});
		}
	}

	fbLogin() {
		let sessionparams = "?session=" + this.state.sessionId
		let authUrl = "/users/auth/facebook";
		document.location.href = authUrl + sessionparams;
	}

	onSubmit() {
		event.preventDefault();
		const csrfToken = ReactOnRails.authenticityToken();
		let loginForm = document.getElementById("Login-form");
		const data = new FormData(loginForm);

		const config = {
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
				"X-CSRF-Token": csrfToken
			}
		};
		axios
			.post("/users/sign_in", data, config)
			.then(response => {
				if (response.data.errors) {
					let errors = response.data.errors;
					this.setState({
						formErrors: errors
					});
				} else {
					if (this.state.sessionId) {
						document.location.href = "/sessions/" + this.state.sessionId;
					} else {
						document.location.href = "/";
					}
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	}

	onChange() {
		this.setState({
			[event.target.id]: event.target.value
		});
	}
	render() {
		return (
			<div className="main_container">
				<div className="mt-4 text-center whitespace-pre-wrap">
					{this.state.formErrors}
				</div>
				<LoginForm
					onSubmit={this.onSubmit}
					onChange={this.onChange}
					email={this.state.email}
					password={this.state.password}
					fbLogin={this.fbLogin}
				/>
			</div>
		);
	}
}

export default Login;
