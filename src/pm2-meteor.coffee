# cli = require 'cli'
program = require 'commander'
cmds = require './commandList'

program
  .version('0.3.0')

program
  .command('init')
  .description("init a pm2-meteor settings file")
  .action ()->
    cmds["init"]()
program
  .command('deploy')
  .description('deploy your App to the server(s)')
  .option('-r, --reconfig', "Settings have changed and PM2 should reset the env")
  .action ()->
    cmds["deploy"](this.reconfig)
program
  .command('start')
  .description('start your App on the server(s)')
  .action ()->
    cmds["start"]()
program
  .command('stop')
  .description('stop your App on the server(s)')
  .action ()->
    cmds["stop"]()
program
  .command('status')
  .description('print the status of your App (nodes)')
  .action ()->
    cmds["status"]()
program
  .command('generateBundle')
  .description('generates a tarball, containing the Nodejs build and a pm2-env.json file')
  .action ()->
    cmds["generateBundle"]()
program
  .command('undeploy')
  .description('undeploy your App from the server(s) - DANGEROUS!')
  .action ()->
    cmds["undeploy"]()
program
  .command('logs')
  .description('stream realtime logs for App')
  .action ()->
    cmds["logs"]()
program
  .command('scale <instances>')
  .description('scale App to number-of-instances')
  .action( (instances)->
    cmds["scale"]("#{instances}")
  ).on '--help', ()->
    console.log "  Examples:"
    console.log "  $ pm2-meteor scale +2"
    console.log "  $ pm2-meteor scale 4"
program.on '--help', ()->
  console.log "  Visit us:"
  console.log ""
  console.log "    http://betawerk.co/"
  console.log ""
program.parse(process.argv)
