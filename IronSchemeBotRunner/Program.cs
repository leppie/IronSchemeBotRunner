using System;
using System.Diagnostics;
using IronSchemeBotRunner.Properties;

namespace IronSchemeBotRunner
{
    internal class Program
    {
        private static int Main(string[] args)
        {
            var stopwatch = Stopwatch.StartNew();
            
            var r = RunBot(args);

            stopwatch.Stop();
            Console.WriteLine("[BOT]\tBot finished in {0} ms.", stopwatch.ElapsedMilliseconds);
            return r;
        }

        private static int RunBot(string[] args)
        {
            if (args.Length != 1)
            {
                PrintUsage();
                return 0;
            }

            var outputPath = GetOutputPathFromArguments(args);

            var bot = new IronSchemeBotRunner(outputPath);
            return bot.Execute();
        }

        private static void PrintUsage()
        {
            Console.WriteLine("IronScheme Bot Runner usage: IronSchemeBotRunner.exe <outputFilename>");
            Console.WriteLine();
            Console.WriteLine("\toutputPath\tThe output folder where the match runner will output map and state files and look for the move file.");
        }

        private static string GetOutputPathFromArguments(string[] args)
        {
            if (!string.IsNullOrEmpty(args[0]))
            {
                return args[0];
            }

            Console.WriteLine("Invalid output filename default to: " + Settings.Default.OutputFile);
            return Settings.Default.OutputFile;
        }
    }
}