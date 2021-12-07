
classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        ChipmunkButton    matlab.ui.control.Button
        DrunkButton       matlab.ui.control.Button
        ChipmunkButton_3  matlab.ui.control.Button
        DrunkButton_2     matlab.ui.control.Button
        ChipmunkButton_2  matlab.ui.control.Button
        DrunkButton_3     matlab.ui.control.Button
        NormalButton      matlab.ui.control.Button
        NormalButton_2    matlab.ui.control.Button
        NormalButton_3    matlab.ui.control.Button
        UIAxes            matlab.ui.control.UIAxes
        UIAxes_2          matlab.ui.control.UIAxes
        UIAxes_3          matlab.ui.control.UIAxes
    end
    properties (Access = public)

    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ChipmunkButton
        function ChipmunkButtonPushed(app, event)
            sound(Alasy,fs*2);
        end

        % Button pushed function: DrunkButton
        function DrunkButtonPushed(app, event)
            sound(Alasy,fs/2);
        end

        % Button pushed function: ChipmunkButton_3
        function ChipmunkButton_3Pushed(app, event)
            sound(Poory,fs*2);
        end

        % Button pushed function: DrunkButton_2
        function DrunkButton_2Pushed(app, event)
            sound(Poory,fs/2);
        end

        % Button pushed function: ChipmunkButton_2
        function ChipmunkButton_2Pushed(app, event)
            sound(Yoricky,fs*2);
        end

        % Button pushed function: DrunkButton_3
        function DrunkButton_3Pushed(app, event)
            sound(Yoricky,fs/2);
        end

        % Button pushed function: NormalButton
        function NormalButtonPushed(app, event)
            sound(Alasy,fs);
        end

        % Button pushed function: NormalButton_2
        function NormalButton_2Pushed(app, event)
            sound(Poory,fs);
        end

        % Button pushed function: NormalButton_3
        function NormalButton_3Pushed(app, event)
            sound(Yoricky,fs);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create ChipmunkButton
            app.ChipmunkButton = uibutton(app.UIFigure, 'push');
            app.ChipmunkButton.ButtonPushedFcn = createCallbackFcn(app, @ChipmunkButtonPushed, true);
            app.ChipmunkButton.Position = [45 295 100 22];
            app.ChipmunkButton.Text = 'Chipmunk';

            % Create DrunkButton
            app.DrunkButton = uibutton(app.UIFigure, 'push');
            app.DrunkButton.ButtonPushedFcn = createCallbackFcn(app, @DrunkButtonPushed, true);
            app.DrunkButton.Position = [151 295 100 22];
            app.DrunkButton.Text = 'Drunk';

            % Create ChipmunkButton_3
            app.ChipmunkButton_3 = uibutton(app.UIFigure, 'push');
            app.ChipmunkButton_3.ButtonPushedFcn = createCallbackFcn(app, @ChipmunkButton_3Pushed, true);
            app.ChipmunkButton_3.Position = [346 295 100 22];
            app.ChipmunkButton_3.Text = 'Chipmunk';

            % Create DrunkButton_2
            app.DrunkButton_2 = uibutton(app.UIFigure, 'push');
            app.DrunkButton_2.ButtonPushedFcn = createCallbackFcn(app, @DrunkButton_2Pushed, true);
            app.DrunkButton_2.Position = [480 295 100 22];
            app.DrunkButton_2.Text = 'Drunk';

            % Create ChipmunkButton_2
            app.ChipmunkButton_2 = uibutton(app.UIFigure, 'push');
            app.ChipmunkButton_2.ButtonPushedFcn = createCallbackFcn(app, @ChipmunkButton_2Pushed, true);
            app.ChipmunkButton_2.Position = [222 75 100 22];
            app.ChipmunkButton_2.Text = 'Chipmunk';

            % Create DrunkButton_3
            app.DrunkButton_3 = uibutton(app.UIFigure, 'push');
            app.DrunkButton_3.ButtonPushedFcn = createCallbackFcn(app, @DrunkButton_3Pushed, true);
            app.DrunkButton_3.Position = [328 75 100 22];
            app.DrunkButton_3.Text = 'Drunk';

            % Create NormalButton
            app.NormalButton = uibutton(app.UIFigure, 'push');
            app.NormalButton.ButtonPushedFcn = createCallbackFcn(app, @NormalButtonPushed, true);
            app.NormalButton.Position = [96 263 100 22];
            app.NormalButton.Text = 'Normal';

            % Create NormalButton_2
            app.NormalButton_2 = uibutton(app.UIFigure, 'push');
            app.NormalButton_2.ButtonPushedFcn = createCallbackFcn(app, @NormalButton_2Pushed, true);
            app.NormalButton_2.Position = [427 263 100 22];
            app.NormalButton_2.Text = 'Normal';

            % Create NormalButton_3
            app.NormalButton_3 = uibutton(app.UIFigure, 'push');
            app.NormalButton_3.ButtonPushedFcn = createCallbackFcn(app, @NormalButton_3Pushed, true);
            app.NormalButton_3.Position = [271 40 100 22];
            app.NormalButton_3.Text = 'Normal';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [18 316 233 151];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.UIFigure);
            title(app.UIAxes_2, 'Title')
            xlabel(app.UIAxes_2, 'X')
            ylabel(app.UIAxes_2, 'Y')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.Position = [328 316 233 151];

            % Create UIAxes_3
            app.UIAxes_3 = uiaxes(app.UIFigure);
            title(app.UIAxes_3, 'Title')
            xlabel(app.UIAxes_3, 'X')
            ylabel(app.UIAxes_3, 'Y')
            zlabel(app.UIAxes_3, 'Z')
            app.UIAxes_3.Position = [195 113 233 151];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end