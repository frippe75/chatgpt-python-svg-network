# main.py

import network_diagram.network_diagram as nd

def main():
    # Define the labels for your computers in the network
    computer_labels = ['Computer 1', 'Computer 2', 'Computer 3', 'Computer 4', 'Computer 5']

    # Define the label for your network
    network_label = 'my-network'

    # Create and save the network diagram
    nd.create_network_diagram(computer_labels, network_label)

if __name__ == "__main__":
    main()

