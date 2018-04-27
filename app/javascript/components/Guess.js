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
		$.ajax({
			type: 'GET',
			url: '/api/v1/guesses',
		})
		.done(function() {
			console.log("ajax call");
		})
	}
	render () {

		return (
			<center>
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
