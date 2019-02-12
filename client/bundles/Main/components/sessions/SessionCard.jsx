import React from 'react';

export default function SessionCard(props) {
	debugger;
	return (
		<div>
			<div id={props.session.id} className="wrapper" key={props.session.id}>
				<div className='session'>
					<div id={props.session.id} className='session'>
						<h1 className="session_name">{props.session.title}</h1>
						<p>{"Coach name:" + props.session.coach_name}</p>
						<p>{new Date(props.session.start_date).toLocaleString('en-GB', { h12: false })}</p>
					</div>
					<div style={props.buttonName ? {} : { display: "none" }} >
						<button value={props.session.id} onClick={props.showPage} className="button">{props.buttonName}</button>
					</div>
				</div>
			</div>
		</div>
	);
}
