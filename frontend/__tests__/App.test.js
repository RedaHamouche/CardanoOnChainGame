import { render } from "@testing-library/react-native";
import App from "../App";

describe("<App />", () => {
  it("affiche le texte de bienvenue", () => {
    const { getByText } = render(<App />);
    expect(
      getByText("Open up App.js to start working on your app!")
    ).toBeTruthy();
  });

  it("contient un composant Text", () => {
    const { getByText } = render(<App />);
    const text = getByText(/open up app\.js/i);
    expect(text.props.children).toContain("Open up App.js");
  });

  it("applique le style container", () => {
    const { getByTestId } = render(<App />);
    const container = getByTestId("container");
    expect(container.props.style).toMatchObject({
      flex: 1,
      backgroundColor: "#fff",
      alignItems: "center",
      justifyContent: "center",
    });
  });

  it("rend le StatusBar", () => {
    const { UNSAFE_getAllByType } = render(<App />);
    // StatusBar est importé depuis expo-status-bar
    const statusBars = UNSAFE_getAllByType(
      require("expo-status-bar").StatusBar
    );
    expect(statusBars.length).toBeGreaterThan(0);
  });
});
