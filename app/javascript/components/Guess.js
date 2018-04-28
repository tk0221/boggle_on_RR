var React = require("react")
var $ = require("jquery")

class Guess extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			title: props.post.title,
			content: props.post.content
		};
		this.handleTitleChange = this.handleTitleChange.bind(this);
		this.handleContentChange = this.handleContentChange.bind(this);
		this.submitGuess = this.submitGuess.bind(this);
	}

	handleTitleChange(e) {
		this.setState({ title: e.target.value });
	}

	handleContentChange(e) {
		this.setState({ content: e.target.value });
	}
	submitGuess(e) {
		console.log(this.state.content);
		$.ajax({
			type: 'PUT',
			data: {
				guess_word: this.state.content
			},
			url: '/api/v1/gamedatas/'+this.state.content+'.json'
		})
		.done(function(data) {
			console.log(data);
			console.log(this);
		})
	}
	render () {
		return (
		<center>
			<div>
				<div> {this.props.title} </div>
			<br/>
				<div id="main">
				  <div id="board">
				    <div> {this.props.props.r1} </div>
				    <div> {this.props.props.r2} </div>
				    <div> {this.props.props.r3} </div>
				    <div> {this.props.props.r4} </div>
				  </div>
				</div>
			</div>
			<br/>
			<div>
				<input
				type="text"
				name="post[content]"
				value={this.state.content}
				onChange={this.handleContentChange}
				/>
				<input type="submit" value="Submit" onClick={this.submitGuess} />
			</div>
		</center>
			);
	}
}

module.exports = Guess
