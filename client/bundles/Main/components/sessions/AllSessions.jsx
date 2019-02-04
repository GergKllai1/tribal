import React, { Component } from 'react'
import SessionCard from './SessionCard';

export class AllSessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props.sessionlist.sessions,
			sessionType : props.sessionType,
			buttonName : props.buttonName,
			showDetails: false
		}
		this.toggleShowDetails = this.toggleShowDetails.bind(this);
		this.buyStripe = this.buyStripe.bind(this);

	}

	toggleShowDetails() {
		event.preventDefault();
		this.setState(prevState => ({
			showDetails: !prevState.showDetails,
		}));
	}

	buyStripe(){
		document.location.href = "/transactions/new";
	}

	render() {
		let allSessions = this.state.sessions.map(session => {
			if (session.status == this.state.sessionType) {
				return (
						<SessionCard session={session}/>
				);
			}
		});
		return (
			<div id={this.state.sessionType}>
				<h1>{this.state.sessionType} sessions</h1>
				<div className='session_wrapper'>
					<div>{allSessions}</div>
				</div>
				<br />
			</div>)
	}
}

export default AllSessions
