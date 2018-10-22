import React, { Component } from 'react';
import MuralShow from '../components/MuralShow';

class MuralShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      mural: {
        "id": 0,
        "title": "",
        "description": "",
        "location": "",
        "photo": {
          "url": ""
        },
        "upvotes": 0,
        "downvotes": 0,
        "user_id": 0,
        "created_at": "",
        "updated_at": ""
      }
    }
  }

  componentDidMount() {
    fetch(`/api/v1/murals/${this.props.params.id}`)
      .then(response => {
          if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ mural: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <MuralShow
        mural = {this.state.mural}
       />
    )
  }
}

export default MuralShowContainer;
