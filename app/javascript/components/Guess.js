var React = require("react")
var $ = require("jquery")

class Guess extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			content: props.post.content,  	//guess
			words: [],					//word found
			score_board: "",
			score: 0
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
			url: '/welcome/' + this.state.content + '.json',
			success: function(data) {
				if (data.errors) {
					alert(data.errors);
				} else {
					this.setState({words:data.found});  //update word found
					
					var score = 0
					for (var key in data.found) {
						score = score + data.found[key]
					}
					this.setState({score:score});

					var text = JSON.stringify(data.found)
					
					if (text.length < 6)
						text = ""
					else
						text = text.substring(6, text.length-1)
						text = text.split(',').join('\n')

					this.setState({score_board:text});
				}
			}.bind(this)
		})
		.done(function(data) {
			// console.log(data);
		})
	}
	render () {
		console.log(this.state.words);
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
			Score:{this.state.score}
			<br/>
			<textarea readonly rows="10" value={this.state.score_board} />
		</center>
		);
	}
}

module.exports = Guess
