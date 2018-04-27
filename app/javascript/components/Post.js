var React = require("react")
class Post extends React.Component {

  render () {
    return (
      <div>
        <div> {this.props.title} </div>
        <div> {this.props.props.r1} </div>
        <div> {this.props.props.r2} </div>
        <div> {this.props.props.r3} </div>
        <div> {this.props.props.r4} </div>
      </div>
    );
  }
}

module.exports = Post

